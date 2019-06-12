#include "../input.lp".

{ assign(S,P) } :- isShelf(S), isStation(P). %32768

% es geht nicht, dass kein Regal, dass das an der Station georderte Produkt enthält, dieser Station zugewiesen ist
:- target(O,P), #count{ S : assign(S,P), shelved(S,A), ordered(O,A) } < 1.

% es geht nicht, dass ein Regal einer Station zugewiesen ist, wenn dieses Regal kein an der Station geordertes Produkt enthält
:- assign(S,P), target(O,P), #count{ A : shelved(S,A), ordered(O,A) } < 1.

#show assign/2.
