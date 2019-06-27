#include "../input.lp".

{ assignRS(R,S) } :- isRobot(R), isShelf(S).

:- ordered(O,A), #count{ S : assignRS(R,S), shelved(S,A) } < 1.
:- isShelf(S), #count{ R : assignRS(R,S) } > 1.

#show assignRS/2.
