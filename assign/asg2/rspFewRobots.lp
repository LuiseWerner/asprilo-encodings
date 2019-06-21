#include "./rspBasic.lp".

distanceRS(R,S,|X-X'|+|Y-Y'|) :- position(R,(X,Y),0), position(S,(X',Y'),0), isRobot(R), isShelf(S), assign(R,S).
distanceRS(R,S,D) :- distanceRS(S,R,D).
distanceSP(S,P,|X-X'|+|Y-Y'|) :- position(S,(X,Y),0), position(P,(X',Y')), isShelf(S), isStation(P), assign(S,P).
distanceSP(S,P,D) :- distanceSP(P,S,D).
distancePP(P,P',|X-X'|+|Y-Y'|) :- position(P,(X,Y)), position(P',(X',Y')), isStation(P), isStation(P'), assign(S,P), assign(S,P'), isShelf(S), P>P'.
distancePP(P,P',D) :- distancePP(P',P,D).


connected(R,S) :- isRobot(R), assign(R,S).
connected(S,P) :- isShelf(S), assign(S,P).
connected(P,P') :- distancePP(P,P',D), P!=P'.
connected(P,S) :- isStation(P), isShelf(S), isRobot(R), assign(R,S).

rPathElement(R,R,0) :- assign(R,S), isRobot(R).
rPathElement(R,E',N+1) :- rPathElement(R,E,N), connected(E,E'), E!=E', not reached(R,E').

reached(R,E) :- rPathElement(R,E,N).

notReached(R,S) :- assign(R,S), isRobot(R), not reached(R,S).
notReached(R,P) :- assign(R,S), assign(S,P), isRobot(R), not reached(R,P).

:- notReached(E), assign(R,S), assign(S,P), isShelf(S).


% es geht nicht, dass dieselbe Nummer oder dasselbe Element mehrfach vorkommt
:- rPathElement(R,E,N), rPathElement(R,E',N), E!=E'.
:- rPathElement(R,E,N), rPathElement(R,E,N'), N!=N'.


%#show distanceRS/3.
%#show distanceSP/3.
%#show distancePP/3.
#show rPathElement/3.
#show connected/2.
#show reached/2.
#show notReached/1.