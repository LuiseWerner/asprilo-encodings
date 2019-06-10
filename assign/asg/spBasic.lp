#include "../input.lp".

{ assign(S,P) } :- isShelf(S), isStation(P). %32768

% es geht nicht, dass kein Regal, dass das an der Station georderte Produkt enthält, dieser Station zugewiesen ist
:- target(O,P), #count{ S : assign(S,P), shelved(S,A), ordered(O,A) } < 1.

#show assign/2.
