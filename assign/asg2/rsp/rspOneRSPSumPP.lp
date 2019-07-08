#include "./rspBasic.lp".

% This code
% - computes the distances between assigned elements,
% - computes for each RSP combination the sum of
%    - RS-distance,
%    - SP-distance
%    - and sum of stations assigned to the shelf,
% - selects one of these sums for each robot
% - and minimizes the maximal one of the selected sums.

distanceRS(R,S,|X-X'|+|Y-Y'|) :- position(R,(X,Y),0), position(S,(X',Y'),0), isRobot(R), isShelf(S), assign(R,S).
distanceRS(R,S,D) :- distanceRS(S,R,D).
distanceSP(S,P,|X-X'|+|Y-Y'|) :- position(S,(X,Y),0), position(P,(X',Y')), isShelf(S), isStation(P), assign(S,P).
distanceSP(P,S,D) :- distanceSP(S,P,D).
distancePP(P,P',|X-X'|+|Y-Y'|) :- position(P,(X,Y)), position(P',(X',Y')), isStation(P), isStation(P'), assign(S,P), assign(S,P'), isShelf(S), P>P'.
distancePP(P',P,D) :- distancePP(P,P',D).

sum(R,S,P,D+D'+U) :- distanceRS(R,S,D), distanceSP(S,P,D'), U = #sum{ D'' : distancePP(P,P',D'') }.

{sum(R,U) : sum(R,S,P,U) }.
:- isRobot(R), #count{ U : sum(R,U) } > 1.
:- isRobot(R), #count{ U : sum(R,U) } < 1.

chain(U) :- sum(R,U).
chain(U-1) :- chain(U), U > 1.
maxSum(U) :- chain(U), not chain(U+1).

#minimize{ U : maxSum(U) }.

%#show distanceRS/3.
%#show distanceSP/3.
%#show distancePP/3.
%#show sum/2.
%#show maxSum/1.
%#show sum/3.
%#show sum/4.