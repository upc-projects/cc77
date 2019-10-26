:- use_module(library(pce)).

ejemplo:-
    new (D, dialog('Ventana ejemplo', size(600,480))),
    send(D, append(button('Salir', message(D, free)))),
    send(D, open).

:- ejemplo.
