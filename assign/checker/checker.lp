:- isShelf(S), { shelved(S,A) } > 1.
:- isShelf(S), { shelved(S,A) } < 1.
:- isRobot(R), position(R,C,0), highway(C).
:- isShelf(S), position(S,C,0), highway(C).
:- isStation(P), position(P,C), highway(C).
:- { isStation(P) } > 1.
:- { isStation(P) } < 1.
:- X = #count{ R : isRobot(R) }, Y = #count{ S : isShelf(S) }, X != Y.
:- X = #count{ R : isRobot(R) }, Z = #count{ A : product(A) }, X != Z.