% - Control for Domain M ---------------------------------------------------------------------------

:- move(R,_,_), not assign(R,_,_).
:- processed(A,R), shelved(S,A), not assign(R,S,_).

:- position(R,C,T), isRobot(R), position(S,C,0), isShelf(S), not assign(R,S).
