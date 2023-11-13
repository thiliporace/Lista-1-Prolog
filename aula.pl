% Resumo de Prolog

% a. "a é verdadeiro"

% b.

% c :- a,b. "c é verdadeiro SE a E b forem"

% c :- d (:- equivale a SE)

% Todas as variaveis sao constantes

% -------------------------------------------------------------------------

% Lista vazia []

% Exemplos: [1,2,3] , [[2,1]], 'a'

% Cabeca / Cauda : [A | B] , [M,N | X]

% Suponha [1,2,3] em [A | B]
%           A = 1
%           B = 2,3 (lista do resto)

% Suponha [5] em [X | Y]
%           X = 5
%           Y = []

% [1,2] = [1,[2]] = [1,[2,[]]]

% -------------------------------------------------------------------------

% Fatorial:


fat(0,1).
fat(N,R) :- T is N - 1, fat(T,R2), R is R2 * N.



% Tamanho de uma lista:


% para rodar:
% tam([1,2,3], Result).


tam([],0).
tam([X | Y],R) :- tam(Y, T) , R is T + 1.



% Somar os elementos de uma lista:


% para rodar:
% soma([1,2,3],Result).


soma([],0).
soma([X|Y],R) :- soma(Y,T), R is X + T.



% Membro de uma lista:


% para rodar:
% membro(5,[1,2,3,4,5]).


membro(E,[E | _]). % Se E estiver na lista, ele foi encontrado
membro(E,[A | X]) :- membro(E,X).



% Soma de duas listas:


% para rodar:
% soma2l([1,2,3],[2,3,4],Result).


soma2l([],L,L).
soma2l(L,[],L).
soma2l([A | As], [B | Bs], [C | Cs]) :- C is A + B , soma2l(As, Bs, Cs).



% Interseccao de duas listas:


% para rodar:
% inter([1,2,3],[1,2,3,4],Result).


inter([],L,[]).
inter(L,[],[]).
% caso A esteja na lista
inter([A|As],L, [A|W]) :- membro(A,L), inter(As,L,W). 
% caso A nao esteja na lista
inter([A|As],L, W) :- inter(A,L,W).


% ---------------------------------------------------------------------------

% Merge do Mergesort

% para rodar:
% merge([1,2,30],[10,15,20],Result).


merge(L,[],L).
merge([],L,L).
merge([A|As],[B|Bs],[A|X]) :- A < B, merge(As,[B|Bs],X).
merge([A|As],[B|Bs],[B|X]) :- merge([A|As],Bs,X).



% Split do Mergesort

% para rodar:
% split([1,2,30],Result1,Result2).


split([],[],[]).
split([A],[A],[]).
split([A,B|X],[A|As],[B|Bs]) :- split(X,As,Bs).



% Mergesort

% para rodar:
% msort([1,40,30],Result).


msort([],[]).
msort([A],[A]).
msort(L,R) :- split(L,L1,L2), msort(L1,R1), msort(L2,R2), merge(R1,R2,R).



% Partition

% para rodar:
% partition(5,[1,2,3,5,7,8,9],Result1,Result2).


partition(P,[],[],[]).
partition(P,[A|X],[A|Y],W) :- A =< P, partition(P,X,Y,W).
partition(P,[A|X],Y,[A|W]) :- partition(P,X,Y,W).



% Quicksort

% para rodar:
% qsort([3,1,2,42,10],Result).


qsort([],[]).
qsort([A],[A]).
qsort([P|X],R) :- partition(P,X,Lmenor,Lmaior), qsort(Lmenor,L1), qsort(Lmaior,L2), append(L1,[P|L2],R).




% RLE(Run Length Encoding)

% para rodar:
% rle([a,a,a,a,a,a,b,b,b,b,c,c,c,c],Result).


rle([],[]).
rle([A|As],R) :- rle(As,A,1,[],R). % elemento e A, quantidade e 1
rle([],A,N,Lac,R) :- append(Lac,[(A,N)],R). % Lac e a lista acumuladora
rle([A|X],A,N,Lac,R) :- N2 is N + 1, rle(X,A,N2,Lac,R).
rle([A|As],B,N,Lac,R) :- append(Lac,[(B,N)],Lac2), rle(As,A,1,Lac2,R).



% Repete

% para rodar:
% repete([a],3,Result).


repete(A,0,[]).
repete(A,N,[A|As]) :- N2 is N - 1, repete(A,N2,As).



% RLD(Run Length Decoding)

% para rodar:
% rld([(a,6)],Result).


rld([],[]).
rld(L,R) :- aux(L,[],R).
aux([],Lac,Lac).
aux([(A,N)|X],Lac,R) :- repete(A,N,L), append(Lac,L,Lac2), aux(X,Lac2,R).