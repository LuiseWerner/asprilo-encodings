% only numR robots are allowed to move
:- #count{ 1,R' : move(R',_,_) } > numR.

%for time efficience
:- #count{ 1,R' : pickup(R',_,_) } > numR.
:- #count{ 1,R' : putdown(R',_,_) } > numR.