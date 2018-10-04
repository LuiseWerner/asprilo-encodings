#include "./Storage.lp".

distance(R,(X,Y),|X-X'|) :- position(R,(X',Y'),0), isRobot(R), storageIndex(X,Y).
#minimize{ D@1,R,(X,Y) : distance(R,(X,Y),D), storageAssign(R,(X,Y)) }.