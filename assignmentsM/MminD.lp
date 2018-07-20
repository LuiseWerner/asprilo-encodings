#include "../input.lp".

{ assign(R,S,P) } :- isRobot(R), isShelf(S), isStation(P).

% müsste über M schon abgefangen sein:
:- ordered(O,A), #count { S : assign(_,S,P), shelved(S,A), target(O,P) } = 0.
:- isShelf(S), #count{ R : assign(R,S,_) } > 1.                 % Too strong?? :- assign(R,S,P), assign(R',S,P), R<R'.
:- isRobot(R), #count{ S : assign(R,S,_) } > 1.
% es geht nicht, dass es mehr zugeordnete Regale gibt als Roboter vorhanden sind
%:- X = #count{ R : isRobot(R) } < Y = #count{ S : isShelf(S), assign(R,S,P) }.

% Sonstiges
:- assign(_,S,P), #count { A : ordered(O,A), shelved(S,A), target(O,P) } = 0.


distance(R,S,|X-X'|+|Y-Y'|) :- position(R,(X,Y),0), position(S,(X',Y'),0), isRobot(R), isShelf(S).
minH(X) :- X = #max{ D : distance(R,S,D), assign(R,S,P) }.

#minimize { D@0,R,S,P : assign(R,S,P), distance(R,S,D) }.

%#show assign/3.
%#show init/2.
%#show distance/3.
#show distance(R,S,D) : distance(R,S,D), assign(R,S,P).
#show minH/1.