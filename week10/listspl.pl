progenitor(pedro, [ana, ramon, pedro]).
progenitor(juan, [ben, pepe, josue]).

padreDe(Padre, Hijo):-
progenitor(Padre, Hijos),
buscar(Hijo, Hijos).

buscar(Hijo, []):- !, fail.
buscar(Hijo, [Hijo|L]) :- !, true.
buscar(Hijo, [C|L]) :- buscar(Hijo, L).
    
