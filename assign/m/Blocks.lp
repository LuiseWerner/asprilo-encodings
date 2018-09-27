#include "../../input.lp".

{ assign(R,S) } :- isRobot(R), isShelf(S).
:- isRobot(R), #count{ S : assign(R,S) } > 1.
:- isShelf(S), #count{ R : assign(R,S) } > 1.

:- ordered(O,A), #count{ S : assign(R,S), shelved(S,A) } != 1.

isBlockNode(X,Y) :- position((X,Y)), not highway((X,Y)), not position(P,(X,Y)), isStation(P), not position(R,(X,Y),0), isRobot(R). %fehlerhaft
blockIndex(X,Y) :- isBlockNode(X,Y), highway((X',Y')), |X-X'|+|Y-Y'| = 1, X+Y > X'+Y', highway((X'',Y'')), |X-X''|+|Y-Y''| = 1, X+Y > X''+Y'', |X'-X''|+|Y'-Y''|>0.
neighbour((X,Y),(X',Y')) :- isBlockNode(X,Y), isBlockNode(X',Y'), |X-X'|+|Y-Y'|=1.
inBlock((X,Y),(X,Y)) :- blockIndex(X,Y). %Feld selbst
inBlock((X',Y'),(X,Y)) :- blockIndex(X,Y), isBlockNode(X',Y'), neighbour((X,Y),(X',Y')). %benachbartes Feld
inBlock((X',Y'),(X,Y)) :- neighbour((X',Y'),(X'',Y'')), inBlock((X'',Y''),(X,Y)). %Nachbarn von Nachbarn

shelvesInBlock(N,(X,Y)) :- blockIndex(X,Y), #count{ S : position(S,(X',Y'),0), inBlock((X',Y'),(X,Y)), assign(R,S) } = N.

{ blockAssign(R,(X,Y)) } :- shelvesInBlock(N,(X,Y)), isRobot(R).	       %32
%:- 0 != #sum{ 1,N : shelvesInBlock(N,(X,Y)) ; -1,R : blockAssign(R,(X,Y)) }.   %18
%:- 0 != #sum{ 1,N,X,Y : shelvesInBlock(N,(X,Y)) ; -1,R,X,Y : blockAssign(R,(X,Y)) }.   %12
%:- isRobot(R), #count{ (X,Y) : blockAssign(R,(X,Y)) } > 1.		       %8
:- shelvesInBlock(N,(X,Y)), #count{ R : blockAssign(R,(X,Y)) } != N.	       %2

:- assign(R,S), blockAssign(R,(X,Y)), position(S,(X',Y'),0), not inBlock((X',Y'),(X,Y)).

#show assign/2.
%#show isBlockNode/2.
%#show neighbour/2.
#show blockIndex/2.
%#show inBlock/2.
#show shelvesInBlock/2.
#show blockAssign/2.