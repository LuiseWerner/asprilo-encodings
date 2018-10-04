#include "./Storage.lp".

isSmallerR(R,R') :- isRobot(R), isRobot(R'), position(R,(X,Y),0), position(R',(X',Y'),0), Y<Y', assign(R,S), assign(R',S').
isSmallerS((X,Y),(X',Y')) :- storageIndex(X,Y), storageIndex(X',Y'), 			  Y<Y'.
  
%alternative: south smaller than north ------------
%isSmallerR(R,R') :- isRobot(R), isRobot(R'), position(R,(X,Y),0), position(R',(X',Y'),0), Y>Y', assign(R,S), assign(R',S').
%isSmallerS((X,Y),(X',Y')) :- storageIndex(X,Y), storageIndex(X',Y'), 			  Y>Y'.
%--------------------------------------------------

isSmallerR(R,R') :- isRobot(R), isRobot(R'), position(R,(X,Y),0), position(R',(X',Y'),0), Y=Y', X<X', assign(R,S), assign(R',S').
isSmallerS((X,Y),(X',Y')) :- storageIndex(X,Y), storageIndex(X',Y'), 			  Y=Y', X<X'.

indexR(R,I) :- isRobot(R), #count{ R' : isRobot(R'), isSmallerR(R',R) } = I.

indexStart((X,Y),I) :- storageIndex(X,Y), #sum{ N' : shelvesInStorage(N',(X',Y')), isSmallerS((X',Y'),(X,Y)) } = I.
indexEnd((X,Y),I-1) :- storageIndex(X,Y), #sum{ I' : indexStart((X,Y),I') ;  N : shelvesInStorage(N,(X,Y)) } = I.

:- storageAssign(R,(X,Y)), indexR(R,I), indexStart((X,Y),I'), I<I'.
:- storageAssign(R,(X,Y)), indexR(R,I), indexEnd((X,Y),I')  , I>I'.


%#show isSmallerR/2.
#show indexR/2.
#show isSmallerS/2.
#show indices((X,Y),(I,I')) : indexStart((X,Y),I), indexEnd((X,Y),I').
