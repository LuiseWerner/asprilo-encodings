bestAsg(S,P,T) :- process(A,O,C,T), isShelf(S), isStation(P), ordered(O,A), shelved(S,A), target(O,P), position(S,C,T).

#show bestAsg/3.
#show asg/3.