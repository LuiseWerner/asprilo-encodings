#program step(t).
%hi(N)
hi(O,A,C) :- #count{ (O,A,C) : process(O,A,C,T) } > 1, ordered(O,A), position(P,C), target(O,P).
#show hi/3.
#show process/4.