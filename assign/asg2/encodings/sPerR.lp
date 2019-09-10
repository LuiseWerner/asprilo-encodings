#include "../basics/rspDet.lp".

% use as few shelves per robot as possible --> minimize maximal number of to robot assigned shelves
chain1(N) :- isRobot(R), N = #count{ S : assignRS(R,S), isShelf(S) }.
chain1(N-1) :- chain1(N), N > 1.
maxNum(N) :- chain1(N), not chain1(N+1).
#minimize{ N@0 : maxNum(N) }.
