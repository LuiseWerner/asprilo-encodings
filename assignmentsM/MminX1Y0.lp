#include "../input.lp".

{ assign(R,S,P) } :- isRobot(R), isShelf(S), isStation(P).

:- ordered(O,A), #count { S : assign(_,S,P), shelved(S,A), target(O,P) } = 0.
:- assign(_,S,P), #count { A : ordered(O,A), shelved(S,A), target(O,P) } = 0.
:- isShelf(S), #count{ R : assign(R,S,_) } > 1.                 % Too strong?? :- assign(R,S,P), assign(R',S,P), R<R'.
:- isRobot(R), #count{ S : assign(R,S,_) } > 1.

distanceX(R,S,|X-X'|) :- position(R,(X,Y),0), position(S,(X',Y'),0), isRobot(R), isShelf(S).
distanceY(R,S,|Y-Y'|) :- position(R,(X,Y),0), position(S,(X',Y'),0), isRobot(R), isShelf(S).

#minimize { D@1,R,S,P : assign(R,S,P), distanceX(R,S,D) }.
#minimize { D@0,R,S,P : assign(R,S,P), distanceY(R,S,D) }.

#show assign/3.
#show init/2.
