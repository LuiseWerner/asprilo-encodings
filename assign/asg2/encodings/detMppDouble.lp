#include "../basics/rspDet.lp".

distanceRS(R,S,|X-X'|+|Y-Y'|) :- position(R,(X,Y),0), position(S,(X',Y'),0), isRobot(R), isShelf(S), assignRS(R,S).
distanceSP(S,P,|X-X'|+|Y-Y'|) :- position(S,(X,Y),0), position(P,(X',Y')), isShelf(S), isStation(P), assignSP(S,P).
distancePP(P,P',|X-X'|+|Y-Y'|) :- position(P,(X,Y)), position(P',(X',Y')), isStation(P), isStation(P'), assignSP(S,P), assignSP(S,P'), isShelf(S), P>P'.
distancePP(P',P,D) :- distancePP(P,P',D).

% for each assigned robot compute one distance to a shelf, using distance-atoms
chain4(R,D) :- assignRS(R,_), distanceRS(R,S,D).
chain4(R,D) :- chain4(R,D), D' < D, assignRS(R,_), distanceRS(R,S,D').
movesRS(R,D) :- chain4(R,D), not chain4(R,D-1).

% for each assigned shelf compute one distance to a station, using distance-atoms
chain5(S,D) :- assignSP(S,_), distanceSP(S,P,D).
chain5(S,D) :- chain5(S,D), D' < D, assignSP(S,_), distanceSP(S,P,D').
movesSP(S,D) :- chain5(S,D), not chain5(S,D-1).

% for each assigned robot iterate over assigned shelves and take the distance to one station,
% sum these distances, take them twice and add the RS-distance
movesRSP(R,D,D',D+2*D') :- movesRS(R,D), D' = #sum{ D''',S : movesSP(S,D'''), assignRS(R,S) }.

% for each assigned shelf compute the maximal distance between assigned stations
chain3(S,D) :- assignSP(S,P), assignSP(S,P'), P!=P', distancePP(P,P',D).
chain3(S,D-1) :- chain3(S,D), D' < D, assignSP(S,P), assignSP(S,P'), P!=P', distancePP(P,P',D').
maxDistPP(S,D) :- chain3(S,D), not chain3(S,D+1).
maxDistPP(S,0) :- assignSP(S,_), #count{ P,S' : assignSP(S',P) } < 2.

% for each assigned robot iterate over its assigned shelves, sum the maximal distance between assigned stations and add one (for leaving station)
moves(R,D+D'+1) :- movesRSP(R,_,_,D), D' = #sum{ D'',S : maxDistPP(S,D''), assignRS(R,S) }.

% for each robot sum the number of assigned shelves and count it twice (pickup, putdown) and add it to sum
sum(R,D+2*D') :- moves(R,D), D' = #count{ S : assignRS(R,S) }.


% EITHER: sum of costs
%---------------
%#minimize{ D@4,R : sum(R,D) }.
%---------------

% OR: horizon
%---------------
chain2(R,D) :- sum(R,D).
chain2(R,D-1) :- chain2(R,D), D > 1.
maxSum(R,D) :- chain2(R,D), not chain2(R,D+1).
#minimize{ D@4 : maxSum(R,D) }.
%---------------
