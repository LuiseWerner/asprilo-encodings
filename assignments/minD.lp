#include "../input.lp".

{ assign(R,S,P) } :- isRobot(R), isShelf(S), isStation(P).

:- ordered(O,A), #count { S : assign(_,S,P), shelved(S,A), target(O,P) } = 0.
:- assign(_,S,P), #count { A : ordered(O,A), shelved(S,A), target(O,P) } = 0.
:- isShelf(S), #count{ R : assign(R,S,_) } > 1.                 % Too strong?? :- assign(R,S,P), assign(R',S,P), R<R'.

distance(R,S,|X-X'|+|Y-Y'|) :- position(R,(X,Y),0), position(S,(X',Y'),0), isRobot(R), isShelf(S).
distance(S,P,|X-X'|+|Y-Y'|) :- position(S,(X,Y),0), position(P,(X',Y')),   isShelf(S), isStation(P).

#minimize { D+D'@0,R,S,P : assign(R,S,P), distance(R,S,D), distance(S,P,D') }.

#show assign/3.
#show init/2.
