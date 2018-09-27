#include "../../input.lp".

{ assign(R,S) } :- isRobot(R), isShelf(S).
:- isRobot(R), #count{ S : assign(R,S) } > 1.
:- isShelf(S), #count{ R : assign(R,S) } > 1.

:- ordered(O,A), #count{ S : assign(R,S), shelved(S,A) } != 1.

distanceX(R,S,|X-X'|) :- position(R,(X,Y),0), position(S,(X',Y'),0), isRobot(R), isShelf(S), assign(R,S).
distanceY(R,S,|Y-Y'|) :- position(R,(X,Y),0), position(S,(X',Y'),0), isRobot(R), isShelf(S), assign(R,S).

#minimize{ D@1,R,S : distanceX(R,S,D) }.
#minimize{ D@0,R,S : distanceY(R,S,D) }.


#show assign/2.