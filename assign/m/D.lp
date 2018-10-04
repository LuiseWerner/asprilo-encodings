#include "./Simple.lp".

distance(R,S,|X-X'|+|Y-Y'|) :- position(R,(X,Y),0), position(S,(X',Y'),0), isRobot(R), isShelf(S).
#minimize{ D@0,R,S : distance(R,S,D), assign(R,S) }.

%minH(X) :- X = #max{ D : distance(R,S,D), assign(R,S,P) }.