distanceRR(R,R',|X-X'|+|Y-Y'|,T) :- isRobot(R), isRobot(R'), R!=R, time(T), position(R,(X,Y),T), position(R',(X',Y'),T).

#maximize{ D,R,R',T : distanceRR(R,R',D,T) }.

#show distanceRR/4.