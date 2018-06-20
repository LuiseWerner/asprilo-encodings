clingo version 5.2.2
Reading from ...s2_ps1_pr2_u4_o2_N1_encoding-a_maxS.lp ...
Solving...
Answer: 1
init(object(order,1),value(pickingStation,1)). init(object(order,2),value(pickingStation,1)). init(object(node,1),value(at,(1,1))). init(object(node,2),value(at,(2,1))). init(object(node,3),value(at,(1,2))). init(object(node,4),value(at,(2,2))). init(object(order,1),value(line,(1,1))). init(object(order,2),value(line,(2,3))). init(object(pickingStation,1),value(at,(2,1))). init(object(product,1),value(on,(1,1))). init(object(product,2),value(on,(1,3))). init(object(robot,1),value(at,(1,1))). init(object(robot,2),value(at,(2,1))). init(object(shelf,1),value(at,(2,2))). init(object(shelf,2),value(at,(1,2))). occurs(object(robot,2),action(move,(0,1)),1). occurs(object(robot,2),action(move,(0,-1)),3). occurs(object(robot,2),action(move,(0,1)),6). occurs(object(robot,2),action(pickup,()),2). occurs(object(robot,2),action(putdown,()),7). occurs(object(robot,2),action(deliver,(1,1,1)),4). occurs(object(robot,2),action(deliver,(2,2,3)),5).
SATISFIABLE

Models       : 1+
Calls        : 1
Time         : 0.305s (Solving: 0.03s 1st Model: 0.01s Unsat: 0.00s)
CPU Time     : 0.103s

Choices      : 11      
Conflicts    : 9        (Analyzed: 9)
Restarts     : 0       
Model-Level  : 1.0     
Problems     : 1        (Average Length: 0.00 Splits: 0)
Lemmas       : 9        (Deleted: 0)
  Binary     : 1        (Ratio:  11.11%)
  Ternary    : 1        (Ratio:  11.11%)
  Conflict   : 9        (Average Length:    2.8 Ratio: 100.00%) 
  Loop       : 0        (Average Length:    0.0 Ratio:   0.00%) 
  Other      : 0        (Average Length:    0.0 Ratio:   0.00%) 
Backjumps    : 9        (Average:  1.11 Max:   2 Sum:     10)
  Executed   : 9        (Average:  1.11 Max:   2 Sum:     10 Ratio: 100.00%)
  Bounded    : 0        (Average:  0.00 Max:   0 Sum:      0 Ratio:   0.00%)

Rules        : 2458     (Original: 2123)
  Choice     : 21      
Atoms        : 1037     (Original: 1002 Auxiliary: 35)
Bodies       : 1697     (Original: 1402)
  Count      : 6        (Original: 75)
Equivalences : 1208     (Atom=Atom: 182 Body=Body: 161 Other: 865)
Tight        : Yes
Variables    : 409      (Eliminated:    0 Frozen:    0)
Constraints  : 1004     (Binary:  76.8% Ternary:  19.1% Other:   4.1%)

