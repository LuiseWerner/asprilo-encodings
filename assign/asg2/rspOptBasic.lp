#include "./rspBasic.lp".

% use as much robots as possible
%#maximize{ 1@2,R : assignRS(R,S), isRobot(R) }.

% OR: use as few robots
%#minimize{ 1@2,R : assignRS(R,S), isRobot(R) }.

% use as few shelves per robot as possible --> minimize maximal number of to robot assigned shelves
chain1(N) :- isRobot(R), N = #count{ S : assignRS(R,S), isShelf(S) }.
chain1(N-1) :- chain1(N), N > 1.
maxNum(N) :- chain1(N), not chain1(N+1).
#minimize{ N@0 : maxNum(N) }.

% use as few shelves in assignSP
#minimize{ 1@1,S : assignSP(S,P) }.