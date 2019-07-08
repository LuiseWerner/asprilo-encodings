#include "./spBasic.lp".

% This code
% - computes for each shelf the sum of distances between it and all assigned stations
% - and minimizes the maximal sum.

distance(S,P,|X-X'|+|Y-Y'|) :- position(S,(X,Y),0), position(P,(X',Y')), isShelf(S), isStation(P), assign(S,P).

sum(S,U) :- U = #sum{ D: distance(S,P,D) }, isShelf(S).
chain(U) :- sum(S,U).
chain(U-1) :- chain(U), U > 1.
maxSum(U) :- chain(U), not chain(U+1).

#minimize{ U : maxSum(U) }.


#show distance/3.
#show sum/2.
#show maxSum/1.