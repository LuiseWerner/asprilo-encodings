{ assign(S,P) } :- isStation(P), isShelf(S).

:- ordered(O,A), target(O,P), isShelf(S), not assign(S,P).