#include "./rspBasic.lp".

% use as much robots as possible
#maximize{ 1@2,R : assign(R,S), isRobot(R) }.

% use as few shelves per robot as possible --> minimize maximal number of to robot assigned shelves
chain1(N) :- isRobot(R), N = #count{ S : assign(R,S), isShelf(S) }.
chain1(N-1) :- chain1(N), N > 1.
maxNum(N) :- chain1(N), not chain1(N+1).
#minimize{ N@1 : maxNum(N) }.

% minimize maximal rs- and sp-distance of each robot
distanceRS(R,S,|X-X'|+|Y-Y'|) :- position(R,(X,Y),0), position(S,(X',Y'),0), isRobot(R), isShelf(S), assign(R,S).
distanceRS(R,S,D) :- distanceRS(S,R,D).
distanceSP(S,P,|X-X'|+|Y-Y'|) :- position(S,(X,Y),0), position(P,(X',Y')), isShelf(S), isStation(P), assign(S,P).
distanceSP(P,S,D) :- distanceSP(S,P,D).

sumRS(R,U) :- isRobot(R), U = #sum{ D : distanceRS(R,S,D) }.
sum(R,U+U') :- sumRS(R,U), U' = #sum{ D' : distanceSP(S,P,D'), assign(R,S) }.

chain2(U) :- sum(R,U).
chain2(U-1) :- chain2(U), U > 1.
maxSum(U) :- chain2(U), not chain2(U+1).

#minimize{ U@0 : maxSum(U) }.

#show maxNum/2.
#show numR/1.
#show sumRS/2.
#show sum/2.
#show maxNum/1.
#show maxSum/1.