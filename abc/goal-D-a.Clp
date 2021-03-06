#include "./quantities.Clp".



:- ordered(O,A), &sum { ordered(O,A,horizon) } > 0.

:- carries(_,_,horizon).

:- position(_,(X,Y)), isRobot(R),
   &sum { positionX(R,horizon) } = X, &sum { positionY(R,horizon) } = Y.
:- position(_,(X,Y)), isShelf(S),
   &sum { positionX(S,horizon) } = X, &sum { positionY(S,horizon) } = Y.
