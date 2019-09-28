progenitor(clara, pedro).
progenitor(pedro, jose).
progenitor(ana, clara).
progenitor(jose, clara).


sumar(A,B,R):-R is A + B.

factorial(0, 1) :- !.
factorial(N, F) :-
    N > 0, N1 is N - 1,
    factorial(N1, F1),
    F is N * F1.

sumatoria(0,0) :- !.
sumatoria(N, F) :-
    N > 0, N1 is N - 1,
    sumatoria(N1, F1),
    F is N + F1.

sumatoriaPares(0,0) :- !.
sumatoriaPares(N,F) :-
    N > 0, N1 is N - 1,
    sumatoriaPares(N1, F1),
    0 is mod(N1,2) -> F is N + F1 ; writef('impar').



