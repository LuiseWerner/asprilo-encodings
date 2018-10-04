#include "./Simple.lp".

distance(R,S,|Y-Y'|) :- position(R,(X,Y),0), position(S,(X',Y'),0), isRobot(R), isShelf(S).
#minimize { D@0,R,S : distance(R,S,D), assign(R,S) }.
