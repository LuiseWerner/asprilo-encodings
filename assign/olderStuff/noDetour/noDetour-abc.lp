#const toleranceRS = 0.
#const toleranceSP = 0.

distance(R,S,|X-X'|+|Y-Y'|) :- position(R,(X,Y),0), position(S,(X',Y'),0), assign(R,S,_).
distance(S,P,|X-X'|+|Y-Y'|) :- position(S,(X,Y),0), position(P,(X',Y')),   assign(_,S,P).

destination(R,C,D+toleranceRS) :- assign(R,S,P), position(S,C,0), distance(R,S,D).
destination(R,C,D+toleranceRS + 1 + D'+toleranceSP) :- assign(R,S,P), position(R,C),   distance(R,S,D), distance(S,P,D').

done(R,C) :- destination(R,C,D), position(R,C,_).

%:- not done(R,C), destination(R,C,T'), time(T), T>=T'.
#minimize{ 1,R,C,T : not done(R,C), destination(R,C,T'), time(T), T>=T'}.

