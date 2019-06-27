#include "./rspBasic.lp".

% minimize maximal approximated distance of each robot
distanceRS(R,S,|X-X'|+|Y-Y'|) :- position(R,(X,Y),0), position(S,(X',Y'),0), isRobot(R), isShelf(S), assignRS(R,S).
distanceSP(S,P,|X-X'|+|Y-Y'|) :- position(S,(X,Y),0), position(P,(X',Y')), isShelf(S), isStation(P), assignSP(S,P).
distancePP(P,P',|X-X'|+|Y-Y'|) :- position(P,(X,Y)), position(P',(X',Y')), isStation(P), isStation(P'), assignSP(S,P), assignSP(S,P'), isShelf(S), P>P'.
distancePP(P',P,D) :- distancePP(P,P',D).

distPPPerS(S,D') :- isShelf(S), assignSP(S,P), assignSP(S,P'), distancePP(P,P',D').
maxDistPP(S,D') :- isShelf(S), D' = #max{ D : distPPPerS(S,D) }, #count{ P : assignSP(S,P) } > 1.
maxDistPP(S,0) :- isShelf(S), assignSP(S,P), #count{ (S,P') : assignSP(S,P'), P!=P' } < 1.

%working
{ minRS(R,D) : assignRS(R,S) } :- isRobot(R), D = #min{ D' : distanceRS(R,S,D'), assignRS(R,S) }.
%:- isRobot(R), minRS(R,D), D=#sup.
:- assignRS(R,_), not minRS(R,_).

sumSP(R,D'+2*U',U') :- minRS(R,D'), U' = #sum{ D,S,P : distanceSP(S,P,D), assignRS(R,S) }.
sum(R,U+U',U') :- sumSP(R,U,U''), U' = #sum{ D,S : maxDistPP(S,D), assignRS(R,S) }.

chain2(U) :- sum(R,U,U').
chain2(U-1) :- chain2(U), U > 1.
maxSum(U) :- chain2(U), not chain2(U+1).

#minimize{ U@0 : maxSum(U) }.

#show chain1/3.
#show minRS/2.
#show maxDistPP/2.
#show minRS/2.
#show sumSP/3.
#show sum/3.
#show maxSum/1.
#show distanceRS/3.
#show distanceSP/3.
#show distancePP/3.
#show minRS2/2.
#show test/1.