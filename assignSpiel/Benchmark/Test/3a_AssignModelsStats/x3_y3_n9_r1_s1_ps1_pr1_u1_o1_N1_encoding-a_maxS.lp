clingo version 5.2.2
Reading from ...s_a/x3_y3_n9_r1_s1_ps1_pr1_u1_o1_N1.lp ...
Solving...
Optimization: -1
Answer: 1
init(object(order,1),value(pickingStation,1)). init(object(node,1),value(at,(1,1))). init(object(node,2),value(at,(2,1))). init(object(node,3),value(at,(3,1))). init(object(node,4),value(at,(1,2))). init(object(node,5),value(at,(2,2))). init(object(node,6),value(at,(3,2))). init(object(node,7),value(at,(1,3))). init(object(node,8),value(at,(2,3))). init(object(node,9),value(at,(3,3))). init(object(order,1),value(line,(1,1))). init(object(pickingStation,1),value(at,(1,3))). init(object(product,1),value(on,(1,1))). init(object(robot,1),value(at,(2,3))). init(object(shelf,1),value(at,(3,1))). assign(robot(1),shelf(1),station(1)).
OPTIMUM FOUND

Models       : 1
  Optimum    : yes
Optimization : -1
Calls        : 1
Time         : 0.050s (Solving: 0.00s 1st Model: 0.00s Unsat: 0.00s)
CPU Time     : 0.015s

Choices      : 0       
Conflicts    : 0        (Analyzed: 0)
Restarts     : 0       
Model-Level  : 0.0     
Problems     : 1        (Average Length: 0.00 Splits: 0)
Lemmas       : 0        (Deleted: 0)
  Binary     : 0        (Ratio:   0.00%)
  Ternary    : 0        (Ratio:   0.00%)
  Conflict   : 0        (Average Length:    0.0 Ratio:   0.00%) 
  Loop       : 0        (Average Length:    0.0 Ratio:   0.00%) 
  Other      : 0        (Average Length:    0.0 Ratio:   0.00%) 
Backjumps    : 0        (Average:  0.00 Max:   0 Sum:      0)
  Executed   : 0        (Average:  0.00 Max:   0 Sum:      0 Ratio:   0.00%)
  Bounded    : 0        (Average:  0.00 Max:   0 Sum:      0 Ratio: 100.00%)

Rules        : 45      
  Choice     : 1       
  Minimize   : 1       
Atoms        : 43      
Bodies       : 1       
Tight        : Yes
Variables    : 1        (Eliminated:    0 Frozen:    0)
Constraints  : 0        (Binary:   0.0% Ternary:   0.0% Other:   0.0%)

