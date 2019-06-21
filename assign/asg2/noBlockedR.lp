#include "./rspBasic.lp".

% check if surrounded by robots

% wall on right, wall on left, no walls
%       X|      |X                X
% _____XR|      |RX____        __XRX__

surrounded(R,R',R'') :- isRobot(R), isRobot(R'), R!=R', position(R,(X,Y),0), position(R',(X,Y-1),0), isRobot(R''), R!=R'', position(R'',(X-1,Y),0), not position((X+1,Y)).

surrounded(R,R',R'') :- isRobot(R), isRobot(R'), R!=R', position(R,(X,Y),0), position(R',(X,Y-1),0), isRobot(R''), R!=R'', position(R'',(X+1,Y),0), not position((X-1,Y)).

surrounded(R,R',R'',R''') :- isRobot(R), isRobot(R'), R!=R', position(R,(X,Y),0), position(R',(X,Y-1),0), isRobot(R''), R!=R'', position(R'',(X+1,Y),0), isRobot(R'''), R!=R''', position(R''',(X-1,Y),0).


surrounded(R,1) :- surrounded(R,R',R'').
surrounded(R,1) :- surrounded(R,R',R'',R''').

% not surrounded 
surrounded(R,0) :- not surrounded(R,1), isRobot(R).

% check if surrounded by assigned or also blocked robots
blocked(R) :- isRobot(R), surrounded(R,R',R''), not assign(R',_), not assign(R'',_).
blocked(R) :- isRobot(R), surrounded(R,R',R'',R'''), not assign(R',_), not assign(R'',_), not assign(R''',_).
blocked(R) :- isRobot(R), surrounded(R,R',R'',R'''), surrounded(R',R,R'''',R'''''), not assign(R'',_), not assign(R''',_).

blocked(R,0) :- not blocked(R), isRobot(R).

#show surrounded/2.