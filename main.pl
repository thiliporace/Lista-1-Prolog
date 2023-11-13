% Thiago Leandro Liporace, 42128481
% Lista 1 de Prolog

% exercicio 1:

onde(elem, [elem|_], 1).
onde(elem, [_|resto], pos) :- onde(elem, resto, pos_atual),
    pos is pos_atual + 1.


% exercicio 2:

ateh(_, [], []).
ateh(elem, [elem|_], [elem]).
ateh(elem, [x|resto], [x|lista]) :- x \= elem, ateh(elem, resto, lista).


% exercicio 3:

apos(_, [], []).
apos(elem, [elem|resto], resto).
apos(elem, [_|resto], lista) :- apos(elem, resto, lista).


% exercicio 4:

npri(1, [1]).
npri(N, lista) :- N > 1, X is N - 1, npri(X, resto), append(resto, [N], lista).


% exercicio 5:

gera_m_mult(_, 0, []).
gera_m_mult(N, M, lista) :- M > 0, X is M - 1, gera_m_mult(N, X, resto),
    elem is N * M, append(resto, [elem], lista).


% exercicio 6:

split(lista1, lista2, lista3) :- length(lista1, tamanho), 
    result is tamanho // 2, split_at(lista1, result, lista2, lista3).

split_at([], _, [], []).
split_at([X|resto], N, [X|lista1], lista2) :- N > 0, Y is N - 1,
    split_at(Resto, Y, lista2, lista1).


% exercicio 7:

mtam(lista1, lista2) :- length(lista1, tam1), length(lista2, tam2), 
    tam1 = tam2.


% exercicio 8:

tri([], []).
tri([X|resto], [X, X, X|lista]) :- tri(resto, lista).


% exercicio 9:

subs(_, _, [], []).
subs(A, B, [A|As], [B|Bs]) :- subs(A, B, As, Bs).
subs(Y, Z, [X|Ys], [X|Zs) :- X \= Y, subs(Y, Z, Ys, Zs).


% exercicio 10:

mackenzie(N, A, B, lista) :- numero(N, lista_naturais),
    mackenzie_aux(lista_naturais, A, B, lista).

numero(N, lista_naturais) :- numero_aux(N, 1, lista_naturais).

numero_aux(N, N, [N]).
numero_aux(N, X, [X|Xs]) :- X < N, result is X + 1, numero_aux(N, result, Xs).

mackenzie_aux([], _, _, []).
mackenzie_aux([X|Xs], A, B, [X|lista|result]) :-
    (X >= A, X =< B, lista = ['M','A','C','K','E','N','Z','I','E'] ;         lista = []), mackenzie_aux(Xs, A, B, result).





