#include "../../../input.lp".

% wenn ein Produkt bestellt wurde, wird mindestens ein Regal zugewiesen, welches das Produkt enthält und genau 1 Roboter diesem Regal
1 { potential(S) : shelved(S,A) } :- ordered(O,A).
1 { assignRS(R,S) : isRobot(R) } 1 :- potential(S).

#show assignRS/2.

