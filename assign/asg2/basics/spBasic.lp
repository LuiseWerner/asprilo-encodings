#include "../input.lp".

{ assignSP(S,P) } :- isShelf(S), isStation(P).


% es darf nicht sein, dass kein Regal,	   das das an der Station georderte Produkt enthält,   dieser Station zugewiesen ist
:- target(O,P), #count{ S : assignSP(S,P), shelved(S,A), ordered(O,A) } < 1.

% es darf nicht sein, dass mehrere Regale, die das an der Station georderte Produkt enthalten, dieser Station zugewiesen sind
:- target(O,P), #count{ S : assignSP(S,P), shelved(S,A), ordered(O,A) } > 1.


% es geht nicht, dass ein Regal einer Station zugewiesen ist, wenn dieses Regal kein an der Station geordertes Produkt enthält:

%unsat
%:- assign(S,P), target(O,P), #count{ A : shelved(S,A), ordered(O,A) } < 1.

%working, but critical with RS-asg
%:- assign(S,P), #count{ A : target(O,P), shelved(S,A), ordered(O,A) } < 1.

% best
:- assignSP(S,P), isStation(P), #count{ A : target(O,P), shelved(S,A), ordered(O,A) } < 1.
%:- assign(S,P), isShelf(S), #count{ A : target(O,P), shelved(S,A), ordered(O,A) } < 1.

% all unsat, warning global A
%:- assign(S,P), shelved(S,A), #count{ A : target(O,P), ordered(O,A) } < 1.
%:- assign(S,P), ordered(O,A), #count{ A : target(O,P), shelved(S,A) } < 1.
%:- assign(S,P), target(O,P), ordered(O,A), #count{ A : shelved(S,A) } < 1.
%:- assign(S,P), target(O,P), shelved(S,A), #count{ A : ordered(O,A) } < 1.

#show assignSP/2.