distance(R,(X,Y),|X-X'|+|Y-Y'|) :- position(R,(X',Y'),0), isRobot(R), blockIndex(X,Y).
#minimize{ D,R,(X,Y) : distance(R,(X,Y),D), blockAssign(R,(X,Y)) }.
