%#include "../basics/rspOptBasic.lp".
#include "../basics/rspBasic.lp".

%TODO: adapt changes:
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


% for each assigned robot compute one distance to a shelf, using distance-atoms
%1 { oneRS(R,D) : distanceRS(R,S,D) } 1 :- isRobot(R), #count{ S,R : assignRS(R,S), isRobot(R) } > 0.
1 { oneRS(R,D) : distanceRS(R,S,D) } 1 :- assignRS(R,_).

% for each assigned shelf compute one distance to a station, using distance-atoms
1 { oneSP(S,D) : distanceSP(S,P,D) } 1 :- assignSP(S,_).

% for each assigned robot iterate over assigned shelves and take the distance to one station,
% sum these distances, take them twice, subtract one of them (once no way back) and add the RS-distance 
1 { oneRSP(R,D+2*D'-D'') : distanceSP(S,P,D'') } 1 :- oneRS(R,D), D' = #sum{ D''',S : oneSP(S,D'''), assignRS(R,S) }.

% for each assigned robot iterate over its assigned shelves and sum the maximal distance between assigned stations
sum(R,D+D') :- oneRSP(R,D), D' = #sum{ D'',S : maxDistPP(S,D''), assignRS(R,S) }.


% EITHER: sum of costs
%---------------
#minimize{ D@10,R : sum(R,D) }.
%---------------

% OR: horizon
%---------------
%chain2(R,D) :- sum(R,D).
%chain2(R,D-1) :- chain2(R,D), D > 1.
%maxSum(R,D) :- chain2(R,D), not chain2(R,D+1).
%#minimize{ D@10,R : maxSum(R,D) }.
%#minimize{ D@10 : maxSum(R,D) }.
%---------------


#show maxDistPP/2.
#show distanceRS/3.
#show distanceSP/3.
#show distancePP/3.
#show oneRS/2.
#show oneSP/2.
#show oneRSP/2.
#show maxSum/2.
#show sum/2.