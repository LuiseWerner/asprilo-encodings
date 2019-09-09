#include "../../../input.lp".

% für jedes Produkt einer Bestellung (das einer Station zugeordnet ist) wird für genau 1 Regal, das dieses Produkt hält, dieser Station zugewiesen
1 { assignSP(S,P) : shelved(S,A) } 1 :- ordered(O,A), target(O,P).

#show assignSP/2.