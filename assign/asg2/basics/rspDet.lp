#include "rsDet.lp".
#include "spDet.lp".

% es darf nicht sein, dass wenn ein Roboter einem Regal zugewiesen ist, keine Station demselben Regal zugewiesen ist
:- assignRS(R,S), isRobot(R), #count{ P : assignSP(S,P), isStation(P) } < 1.

% es darf nicht sein, dass wenn eine Station einem Regal zugewiesen ist, kein Roboter demselben Regal zugewiesen ist
:- assignSP(S,P), isStation(P), #count{ R : assignRS(R,S), isRobot(R) } < 1.

