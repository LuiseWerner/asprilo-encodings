#include "../../input.lp".

{ assign(R,S) } :- isRobot(R), isShelf(S).
:- isRobot(R), #count{ S : assign(R,S) } > 1.
:- isShelf(S), #count{ R : assign(R,S) } > 1.

:- ordered(O,A), #count{ S : assign(R,S), shelved(S,A) } != 1.

isSmallerXR(R,R') :- isRobot(R), isRobot(R'), position(R,(X,Y),0), position(R',(X',Y'),0), X<X', assign(R,S), assign(R',S').
isSmallerXS(S,S') :- isShelf(S), isShelf(S'), position(S,(X,Y),0), position(S',(X',Y'),0), X<X', assign(R,S), assign(R',S').
indexR(I,R) :- isRobot(R), #count{ R' : isRobot(R'), isSmallerXR(R',R) } = I.
indexS(I,S) :- isShelf(S), #count{ S' : isShelf(S'), isSmallerXS(S',S) } = I.
:- assign(R,S), indexR(I,R), indexS(I',S), I<I'.

%zum Test
%distance(R,S,|X-X'|) :- position(R,(X,Y),0), position(S,(X',Y'),0), isRobot(R), isShelf(S), assign(R,S).
%sumDist(D) :- D = #sum{ D,R,S : distance(R,S,D) }.

sumDist(D) :- D = #sum{ |X-X'|,R,S : position(R,(X,Y),0), position(S,(X',Y'),0), isRobot(R), isShelf(S), assign(R,S) }.


#show assign/2.
#show isSmallerXR/2.
#show isSmallerXS/2.
#show sumDist/1.