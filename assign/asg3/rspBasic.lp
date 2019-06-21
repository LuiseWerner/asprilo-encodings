#include "../input.lp".

{ assign(R,S,P) } :- isRobot(R), isShelf(S), isStation(P).


% es geht nicht, dass etwas bestellt ist und die Anzahl der zugewiesenen Regale, die das bestellte Produkt enthalten 0 ist
%:- ordered(O,A), #count{ S : assign(R,S), shelved(S,A) } < 1.
:- ordered(O,A), #count{ S : assign(R,S,P), shelved(S,A) } < 1.

% es geht nicht, dass ein Regal mehr als 1 Roboter zugewiesen ist
%:- isShelf(S), #count{ R : assign(R,S) } > 1.
:- isShelf(S), #count{ R : assign(R,S,P) } > 1.

% es geht nicht, dass kein Regal, dass das an der Station georderte Produkt enthält, dieser Station zugewiesen ist
%:- target(O,P), #count{ S : assign(S,P), shelved(S,A), ordered(O,A) } < 1.
:- target(O,P), #count{ S : assign(R,S,P), shelved(S,A), ordered(O,A) } < 1.

% es geht nicht, dass ein Regal einer Station zugewiesen ist, wenn dieses Regal kein an der Station geordertes Produkt enthält
%:- assign(S,P), target(O,P), #count{ A : shelved(S,A), ordered(O,A) } < 1.
:- assign(R,S,P), target(O,P), #count{ A : shelved(S,A), ordered(O,A) } < 1.

#show assign/3.
