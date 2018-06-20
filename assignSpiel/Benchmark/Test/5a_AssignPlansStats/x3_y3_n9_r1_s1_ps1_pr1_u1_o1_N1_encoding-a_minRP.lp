clingo version 5.2.2
Reading from ...1_ps1_pr1_u1_o1_N1_encoding-a_minRP.lp ...
Solving...
Answer: 1
init(object(order,1),value(pickingStation,1)). init(object(node,1),value(at,(1,1))). init(object(node,2),value(at,(2,1))). init(object(node,3),value(at,(3,1))). init(object(node,4),value(at,(1,2))). init(object(node,5),value(at,(2,2))). init(object(node,6),value(at,(3,2))). init(object(node,7),value(at,(1,3))). init(object(node,8),value(at,(2,3))). init(object(node,9),value(at,(3,3))). init(object(order,1),value(line,(1,1))). init(object(pickingStation,1),value(at,(1,3))). init(object(product,1),value(on,(1,1))). init(object(robot,1),value(at,(2,3))). init(object(shelf,1),value(at,(3,1))). occurs(object(robot,1),action(move,(0,-1)),1). occurs(object(robot,1),action(move,(0,-1)),2). occurs(object(robot,1),action(move,(1,0)),3). occurs(object(robot,1),action(move,(0,1)),5). occurs(object(robot,1),action(move,(-1,0)),6). occurs(object(robot,1),action(move,(0,1)),7). occurs(object(robot,1),action(move,(-1,0)),8). occurs(object(robot,1),action(move,(0,-1)),10). occurs(object(robot,1),action(pickup,()),4). occurs(object(robot,1),action(putdown,()),11). occurs(object(robot,1),action(deliver,(1,1,1)),9).
SATISFIABLE

Models       : 1+
Calls        : 1
Time         : 0.325s (Solving: 0.01s 1st Model: 0.00s Unsat: 0.00s)
CPU Time     : 0.119s

Choices      : 14      
Conflicts    : 8        (Analyzed: 8)
Restarts     : 0       
Model-Level  : 6.0     
Problems     : 1        (Average Length: 0.00 Splits: 0)
Lemmas       : 8        (Deleted: 0)
  Binary     : 1        (Ratio:  12.50%)
  Ternary    : 1        (Ratio:  12.50%)
  Conflict   : 8        (Average Length:    3.9 Ratio: 100.00%) 
  Loop       : 0        (Average Length:    0.0 Ratio:   0.00%) 
  Other      : 0        (Average Length:    0.0 Ratio:   0.00%) 
Backjumps    : 8        (Average:  1.00 Max:   1 Sum:      8)
  Executed   : 8        (Average:  1.00 Max:   1 Sum:      8 Ratio: 100.00%)
  Bounded    : 0        (Average:  0.00 Max:   0 Sum:      0 Ratio:   0.00%)

Rules        : 2139     (Original: 1819)
  Choice     : 22      
Atoms        : 932     
Bodies       : 1554     (Original: 1234)
  Count      : 20       (Original: 55)
Equivalences : 1438     (Atom=Atom: 158 Body=Body: 84 Other: 1196)
Tight        : Yes
Variables    : 777      (Eliminated:    0 Frozen:  159)
Constraints  : 2627     (Binary:  70.8% Ternary:  24.0% Other:   5.1%)

