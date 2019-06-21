#include "./spBasic.lp".

distance(S,P,|X-X'|+|Y-Y'|) :- position(S,(X,Y),0), position(P,(X',Y')), isShelf(S), isStation(P), assign(S,P).

%sum(S,D) :- distance(S,P,D).
sum(S,U) :- U = #sum{ D: distance(S,P,D) }, isShelf(S).
chain(U) :- sum(S,U).
chain(U-1) :- chain(U), U > 1.
maxSum(U) :- chain(U), not chain(U+1).


%chain(D) :- distance(R,S,D), assign(R,S).
%chain(D-1) :- chain(D), D> 1.
%maxDist(D) :- chain(D), not chain(D+1).

#minimize{ U : maxSum(U) }.

#show distance/3.
#show sum/2.
#show maxSum/1.