#include "./rsBasic.lp".
#include "./spBasic.lp".

% es darf nicht sein, dass wenn ein Roboter einem Regal zugewiesen ist, keine Station demselben Regal zugewiesen ist
:- assign(R,S), isRobot(R), #count{ P : assign(S,P), isStation(P) } < 1.

% es darf nicht sein, dass wenn eine Station einem Regal zugewiesen ist, kein Roboter demselben Regal zugewiesen ist
:- assign(S,P), isStation(P), #count{ R : assign(R,S), isRobot(R) } < 1.
