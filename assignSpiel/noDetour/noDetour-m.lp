#const tolerance = 0.

distance(R,S,|X-X'|+|Y-Y'|) :- position(R,(X,Y),0), position(S,(X',Y'),0), assign(R,S,_).

destination(R,C,D+tolerance) :- assign(R,S,P), position(S,C,0), distance(R,S,D).

done(R,C) :- destination(R,C,D), position(R,C,_).

:- not done(R,C), destination(R,C,T'), time(T), T>=T'.
%#minimize{ 1,R,C,T : not done(R,C), destination(R,C,T'), time(T), T>=T'}.

