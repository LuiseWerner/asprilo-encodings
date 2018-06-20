clingo version 5.2.2
Reading from ...s_a/x2_y2_n4_r2_s2_ps1_pr2_u4_o2_N1.lp ...
Solving...
Answer: 1
init(object(order,1),value(pickingStation,1)). init(object(order,2),value(pickingStation,1)). init(object(node,1),value(at,(1,1))). init(object(node,2),value(at,(2,1))). init(object(node,3),value(at,(1,2))). init(object(node,4),value(at,(2,2))). init(object(order,1),value(line,(1,1))). init(object(order,2),value(line,(2,3))). init(object(pickingStation,1),value(at,(2,1))). init(object(product,1),value(on,(1,1))). init(object(product,2),value(on,(1,3))). init(object(robot,1),value(at,(1,1))). init(object(robot,2),value(at,(2,1))). init(object(shelf,1),value(at,(2,2))). init(object(shelf,2),value(at,(1,2))). occurs(object(robot,1),action(move,(0,1)),2). occurs(object(robot,1),action(move,(0,-1)),3). occurs(object(robot,1),action(move,(0,1)),4). occurs(object(robot,2),action(move,(0,1)),1). occurs(object(robot,2),action(move,(0,-1)),3). occurs(object(robot,2),action(move,(-1,0)),6). occurs(object(robot,2),action(pickup,()),2). occurs(object(robot,2),action(putdown,()),7). occurs(object(robot,2),action(deliver,(2,2,3)),4). occurs(object(robot,2),action(deliver,(1,1,1)),5).
SATISFIABLE

Models       : 1+
Calls        : 1
Time         : 0.194s (Solving: 0.01s 1st Model: 0.01s Unsat: 0.00s)
CPU Time     : 0.062s

Choices      : 51      
Conflicts    : 13       (Analyzed: 13)
Restarts     : 0       
Model-Level  : 21.0    
Problems     : 1        (Average Length: 0.00 Splits: 0)
Lemmas       : 13       (Deleted: 0)
  Binary     : 3        (Ratio:  23.08%)
  Ternary    : 3        (Ratio:  23.08%)
  Conflict   : 13       (Average Length:    3.9 Ratio: 100.00%) 
  Loop       : 0        (Average Length:    0.0 Ratio:   0.00%) 
  Other      : 0        (Average Length:    0.0 Ratio:   0.00%) 
Backjumps    : 13       (Average:  2.31 Max:  10 Sum:     30)
  Executed   : 13       (Average:  2.31 Max:  10 Sum:     30 Ratio: 100.00%)
  Bounded    : 0        (Average:  0.00 Max:   0 Sum:      0 Ratio:   0.00%)

Rules        : 2511     (Original: 2000)
  Choice     : 21      
Atoms        : 1112     (Original: 988 Auxiliary: 124)
Bodies       : 1777     (Original: 1402)
  Count      : 0        (Original: 75)
Equivalences : 1384     (Atom=Atom: 134 Body=Body: 142 Other: 1108)
Tight        : Yes
Variables    : 909      (Eliminated:    0 Frozen:    0)
Constraints  : 2831     (Binary:  72.6% Ternary:  22.7% Other:   4.7%)

