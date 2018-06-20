clingo version 5.2.2
Reading from ...s_a/x3_y3_n9_r1_s1_ps1_pr1_u1_o1_N1.lp ...
Solving...
Answer: 1
init(object(order,1),value(pickingStation,1)). init(object(node,1),value(at,(1,1))). init(object(node,2),value(at,(2,1))). init(object(node,3),value(at,(3,1))). init(object(node,4),value(at,(1,2))). init(object(node,5),value(at,(2,2))). init(object(node,6),value(at,(3,2))). init(object(node,7),value(at,(1,3))). init(object(node,8),value(at,(2,3))). init(object(node,9),value(at,(3,3))). init(object(order,1),value(line,(1,1))). init(object(pickingStation,1),value(at,(1,3))). init(object(product,1),value(on,(1,1))). init(object(robot,1),value(at,(2,3))). init(object(shelf,1),value(at,(3,1))). occurs(object(robot,1),action(move,(0,-1)),1). occurs(object(robot,1),action(move,(0,-1)),2). occurs(object(robot,1),action(move,(1,0)),3). occurs(object(robot,1),action(move,(0,1)),5). occurs(object(robot,1),action(move,(-1,0)),6). occurs(object(robot,1),action(move,(0,1)),7). occurs(object(robot,1),action(move,(-1,0)),8). occurs(object(robot,1),action(move,(1,0)),10). occurs(object(robot,1),action(pickup,()),4). occurs(object(robot,1),action(putdown,()),11). occurs(object(robot,1),action(deliver,(1,1,1)),9).
SATISFIABLE

Models       : 1+
Calls        : 1
Time         : 0.396s (Solving: 0.01s 1st Model: 0.01s Unsat: 0.00s)
CPU Time     : 0.132s

Choices      : 20      
Conflicts    : 9        (Analyzed: 9)
Restarts     : 0       
Model-Level  : 6.0     
Problems     : 1        (Average Length: 0.00 Splits: 0)
Lemmas       : 9        (Deleted: 0)
  Binary     : 1        (Ratio:  11.11%)
  Ternary    : 1        (Ratio:  11.11%)
  Conflict   : 9        (Average Length:    3.6 Ratio: 100.00%) 
  Loop       : 0        (Average Length:    0.0 Ratio:   0.00%) 
  Other      : 0        (Average Length:    0.0 Ratio:   0.00%) 
Backjumps    : 9        (Average:  1.56 Max:   6 Sum:     14)
  Executed   : 9        (Average:  1.56 Max:   6 Sum:     14 Ratio: 100.00%)
  Bounded    : 0        (Average:  0.00 Max:   0 Sum:      0 Ratio:   0.00%)

Rules        : 2069     (Original: 1749)
  Choice     : 22      
Atoms        : 925     
Bodies       : 1554     (Original: 1234)
  Count      : 20       (Original: 55)
Equivalences : 1428     (Atom=Atom: 158 Body=Body: 83 Other: 1187)
Tight        : Yes
Variables    : 774      (Eliminated:    0 Frozen:  159)
Constraints  : 2567     (Binary:  70.3% Ternary:  24.6% Other:   5.1%)

