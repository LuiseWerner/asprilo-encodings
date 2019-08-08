#include "../basics/rspOptBasic.lp".
%#include "./rspBasic.lp".

% This code
% - computes the distances between assigned elements,
% - finds out for each robot the minimal distance between the robot and its assigned shelves,
% - finds out for each robot-shelf combination the minimal distance between the shelf and its assigned stations,
% - computes the maximal distance between stations assigned to the same shelf,
% - computes the sum of
%    - the minimal distance between a robot and its assigned shelves,
%    - the sum of minimal distances between all shelves and their assigned stations,
%    - the sum of minimal distances between all shelves and their assigned stations except the largest for each shelf (going backwards),
%    - and the maximal distance between stations assigned to the same shelf
% - and minimizes the maximal one of these sums.

distanceRS(R,S,|X-X'|+|Y-Y'|) :- position(R,(X,Y),0), position(S,(X',Y'),0), isRobot(R), isShelf(S), assignRS(R,S).
distanceSP(S,P,|X-X'|+|Y-Y'|) :- position(S,(X,Y),0), position(P,(X',Y')), isShelf(S), isStation(P), assignSP(S,P).
distancePP(P,P',|X-X'|+|Y-Y'|) :- position(P,(X,Y)), position(P',(X',Y')), isStation(P), isStation(P'), assignSP(S,P), assignSP(S,P'), isShelf(S), P>P'.
distancePP(P',P,D) :- distancePP(P,P',D).

distPPPerS(S,D') :- isShelf(S), assignSP(S,P), assignSP(S,P'), distancePP(P,P',D').
maxDistPP(S,D') :- isShelf(S), D' = #max{ D : distPPPerS(S,D) }, #count{ P : assignSP(S,P) } > 1.
maxDistPP(S,0) :- isShelf(S), assignSP(S,P), #count{ (S,P') : assignSP(S,P'), P!=P' } < 1.

{ minRS(R,D) : assignRS(R,S) } :- isRobot(R), D = #min{ D' : distanceRS(R,S,D'), assignRS(R,S) }.
:- isRobot(R), minRS(R,D), D=#sup.
:- assignRS(R,_), not minRS(R,_).

{ minSP(R,S,D) : assignSP(S,P) } :- assignRS(R,S), D = #min{ D' : distanceSP(S,P,D'), assignSP(S,P) }.
:- isShelf(S), minSP(R,S,D), D=#sup.
:- assignSP(S,_), not minSP(_,S,_).

chain3(R,D) :- minSP(R,S,D).
chain3(R,D-1) :- chain3(R,D), D > 1.
maxMin(R,D) :- chain3(R,D), not chain3(R,D+1).

sumSP(R,D'+2*U-D'',U) :- minRS(R,D'), U = #sum{ D,S : minSP(R,S,D), D != #sup }, maxMin(R,D'').
sum(R,U+U',U') :- sumSP(R,U,U''), U' = #sum{ D,S : maxDistPP(S,D), assignRS(R,S) }.

chain2(U) :- sum(R,U,U').
chain2(U-1) :- chain2(U), U > 1.
maxSum(U) :- chain2(U), not chain2(U+1).

#minimize{ U@2 : maxSum(U) }.

#show minRS/2.
#show maxDistPP/2.
#show minRS/2.
#show sumSP/3.
#show sum/3.
#show maxSum/1.
#show distanceRS/3.
#show distanceSP/3.
#show distancePP/3.
#show minSP/3.
#show maxMin/2.