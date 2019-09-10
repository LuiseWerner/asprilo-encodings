#include "../basics/rspDet.lp".

% minimize shelves per station
#minimize{ 1@2,S,P : assignSP(S,P) }.
