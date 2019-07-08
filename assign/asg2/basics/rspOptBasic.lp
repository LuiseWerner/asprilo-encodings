#include "./rspBasic.lp".

% use as much robots as possible
%#maximize{ 1@3,R : assignRS(R,S), isRobot(R) }.

% OR: use as few robots
%#minimize{ 1@3,R : assignRS(R,S), isRobot(R) }.

% use as few shelves per robot as possible --> minimize maximal number of to robot assigned shelves
chain1(N) :- isRobot(R), N = #count{ S : assignRS(R,S), isShelf(S) }.
chain1(N-1) :- chain1(N), N > 1.
maxNum(N) :- chain1(N), not chain1(N+1).
#minimize{ N@1 : maxNum(N) }.

% use as few shelves in assignSP
#minimize{ 1@2,S : assignSP(S,P) }.

% minimize picks --> minimize SP-assignments
%#minimize{ 1@0,(S,P) : assignSP(S,P) }.