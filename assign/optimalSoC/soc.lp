%used from ../abc/optimization.ilp

%#minimize{ 1@3,R,T :    move(R,_,T) }.

#minimize{ 1@3,R,T :    move(R,_,T);
	   1@3,R,T :  pickup(R,_,T) ;
 	   1@3,R,T : putdown(R,_,T) }.


#show move/3.
%#show pickup/3.
%#show putdown/3.
