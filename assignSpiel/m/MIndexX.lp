#include "../../input.lp".

{ assign(R,S) } :- isRobot(R), isShelf(S).
:- isRobot(R), #count{ S : assign(R,S) } > 1.
:- isShelf(S), #count{ R : assign(R,S) } > 1.

:- ordered(O,A), #count{ S : assign(R,S), shelved(S,A) } != 1.

isSmallerR(R,R') :- isRobot(R), isRobot(R'), position(R,(X,Y),0), position(R',(X',Y'),0), X<X', assign(R,S), assign(R',S').
isSmallerS(S,S') :- isShelf(S), isShelf(S'), position(S,(X,Y),0), position(S',(X',Y'),0), X<X', assign(R,S), assign(R',S').
isSmallerR(R,R') :- isRobot(R), isRobot(R'), position(R,(X,Y),0), position(R',(X',Y'),0), X=X', Y<Y', assign(R,S), assign(R',S').
isSmallerS(S,S') :- isShelf(S), isShelf(S'), position(S,(X,Y),0), position(S',(X',Y'),0), X=X', Y<Y', assign(R,S), assign(R',S').

indexR(R,I) :- isRobot(R), #count{ R' : isRobot(R'), isSmallerR(R',R) } = I.
indexS(S,I) :- isShelf(S), #count{ S' : isShelf(S'), isSmallerS(S',S) } = I.
:- assign(R,S), indexR(R,I), indexS(S,I'), I<I'.
:- assign(R,S), indexR(R,I), indexS(S,I'), I>I'.

%zum Test
%sumDist(D) :- D = #sum{ |X-X'|,R,S : position(R,(X,Y),0), position(S,(X',Y'),0), isRobot(R), isShelf(S), assign(R,S) }.


#show assign/2.
%#show isSmallerR/2.
%#show isSmallerS/2.
%#show sumDist/1.