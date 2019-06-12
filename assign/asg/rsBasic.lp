#include "../input.lp".

{ assign(R,S) } :- isRobot(R), isShelf(S).

:- ordered(O,A), #count{ S : assign(R,S), shelved(S,A) } < 1.
:- isShelf(S), #count{ R : assign(R,S) } > 1.

#show assign/2.
