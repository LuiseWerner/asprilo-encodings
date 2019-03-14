:- { product(A) } > 1.
:- { product(A) } < 1.
:- isShelf(S), { shelved(S,A) } > 1.
:- isShelf(S), { shelved(S,A) } < 1.
:- isRobot(R), position(R,C,0), highway(C).
:- isShelf(S), position(S,C,0), highway(C).
:- isStation(P), position(P,C), highway(C).
:- { isStation(P) } > 1.
:- { isStation(P) } < 1.

%:- #count{ R : isRobot(R) } != #count{ S : isShelf(S) }.
:- X = #count{ R : isRobot(R) }, Y = #count{ S : isShelf(S) }, X != Y.

%:- 0 < #count{ S : isShelf(S); -R : isRobot(R) }.
%:- 0 < #count{ R : isRobot(R); -S : isShelf(S) }.



%- not possible:
%a :- #sum{V,ID,s : skill(ID,V)} > #sum{V,ID,l : level(ID,V)}.
%- not good:
%a :- X = #sum{V,ID,s : skill(ID,V)},
%	 Y = #sum{V,ID,l : level(ID,V)}, X > Y.
%- better:
%a :- 0 < #sum{V,ID,s : skill(ID,V); -V,ID,l : level(ID,V)}.


