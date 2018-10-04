#include "./Simple.lp".

robotPosition(X,Y) :- position(R,(X,Y),0), isRobot(R).
isStorageNode(X,Y) :- position((X,Y)), not highway((X,Y)), not position(P,(X,Y)), isStation(P), not robotPosition(X,Y).
storageIndex(X,Y) :- isStorageNode(X,Y), highway((X',Y')), |X-X'|+|Y-Y'| = 1, X+Y > X'+Y', highway((X'',Y'')), |X-X''|+|Y-Y''| = 1, X+Y > X''+Y'', |X'-X''|+|Y'-Y''|>0.
neighbour((X,Y),(X',Y')) :- isStorageNode(X,Y), isStorageNode(X',Y'), |X-X'|+|Y-Y'|=1.
inStorage((X,Y),(X,Y)) :- storageIndex(X,Y). %Feld selbst
inStorage((X',Y'),(X,Y)) :- storageIndex(X,Y), isStorageNode(X',Y'), neighbour((X,Y),(X',Y')). %benachbartes Feld
inStorage((X',Y'),(X,Y)) :- neighbour((X',Y'),(X'',Y'')), inStorage((X'',Y''),(X,Y)). %Nachbarn von Nachbarn

shelvesInStorage(N,(X,Y)) :- storageIndex(X,Y), #count{ S : position(S,(X',Y'),0), inStorage((X',Y'),(X,Y)), assign(R,S) } = N.


{ storageAssign(R,(X,Y)) } :- shelvesInStorage(N,(X,Y)), isRobot(R).		%seeehr viele

%funktionierende einzelne Zeilen
:- shelvesInStorage(N,(X,Y)), #count{ R : storageAssign(R,(X,Y)) } != N.	%120
%:- isRobot(R), #count{ (X,Y) : storageAssign(R,(X,Y)) } < 1.	       		%120

%schränken Ergebnisse ein, einzelne Werte hinten
%:- isRobot(R), #count{ (X,Y) : storageAssign(R,(X,Y)) } > 1.			%3840
%:- 0 = #sum{ 1,N : shelvesInStorage(N,(X,Y)) ; -1,R : storageAssign(R,(X,Y)) }.%2640
%:- 0 = #sum{ 1,N,X,Y : shelvesInStorage(N,(X,Y)) ; -1,R,X,Y : storageAssign(R,(X,Y)) }.	%2640

:- assign(R,S), storageAssign(R,(X,Y)), position(S,(X',Y'),0), not inStorage((X',Y'),(X,Y)).

%#show isStorageNode/2.
%#show neighbour/2.
%#show storageIndex/2.
%#show inStorage/2.
#show shelvesInStorage/2.
#show storageAssign/2.