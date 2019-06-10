#program step(t).
bestAsg(S,P,t) :- process(A,O,C,t), isShelf(S), isStation(P), ordered(O,A), shelved(S,A), target(O,P), position(S,C,t).

%#program check(t).
%bestAsg(S,P) :- bestAsg(S,P,t), { bestAsg(S,P) } < 1.
%bestAsg(S,P) :- bestAsg(S,P,t), bestAsg(S,P,T) : T = 1..t.

%bestAsg(S,P,T) :- bestAsg(S,P,t), T = 1..t.
%bestAsg(S,P) :- bestAsg(S,P,T).

%asg(S,P,N) :- N = #count{ bestAsg(S,P,T) : T = 1..t }, isShelf(S), isStation(P).

#show bestAsg/3.
#show bestAsg/2.
#show asg/3.