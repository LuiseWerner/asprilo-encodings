#include "./Simple.lp".

distance(R,S,|X-X'|) :- position(R,(X,Y),0), position(S,(X',Y'),0), isRobot(R), isShelf(S).
#minimize{ D@0,R,S : distance(R,S,D), assign(R,S) }.

%-----------
%Alternative
%distance(R,S,|X-X'|) :- position(R,(X,Y),0), position(S,(X',Y'),0), isRobot(R), isShelf(S), assign(R,S).
%#minimize{ D,R,S : distance(R,S,D) }.
%-----------
