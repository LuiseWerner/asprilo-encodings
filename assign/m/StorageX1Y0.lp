#include "./Storage.lp".

distanceX(R,(X,Y),|X-X'|) :- position(R,(X',Y'),0), isRobot(R), storageIndex(X,Y).
distanceY(R,(X,Y),|Y-Y'|) :- position(R,(X',Y'),0), isRobot(R), storageIndex(X,Y).

#minimize{ D@3,R,(X,Y) : distanceX(R,(X,Y),D), storageAssign(R,(X,Y)) }.
#minimize{ D@2,R,(X,Y) : distanceY(R,(X,Y),D), storageAssign(R,(X,Y)) }.