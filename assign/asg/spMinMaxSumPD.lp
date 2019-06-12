#include "./spBasic.lp".

% This code
% - computes for each shelf the distance between it and one assigned station,
% - adds the distance between all other to this shelf assigned stations
% - and minimizes the maximal sum of those distances.

distance(S,P,|X-X'|+|Y-Y'|) :- position(S,(X,Y),0), position(P,(X',Y')), isShelf(S), isStation(P), assign(S,P).
distanceP(P,P',|X-X'|+|Y-Y'|) :- position(P,(X,Y)), position(P',(X',Y')), isStation(P), isStation(P'), assign(S,P), assign(S,P'), isShelf(S), P>P'.
distance(P,S,D) :- distance(S,P,D).
distanceP(P',P,D) :- distance(P,P',D).

sum(S,P,U+D) :- distance(S,P,D), U = #sum{ D' : distanceP(P,P',D') }.

{sum(S,U) : sum(S,P,U) }.
:- isShelf(S), #count{ U : sum(S,U) } != 1.

chain(U) :- sum(S,U).
chain(U-1) :- chain(U), U > 1.
maxSum(U) :- chain(U), not chain(U+1).

#minimize{ U : maxSum(U) }.

#show sum/2.
#show maxSum/1.
#show sum/3.