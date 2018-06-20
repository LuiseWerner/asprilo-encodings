clingo version 5.2.2
Reading from ...s_a/x2_y2_n4_r2_s2_ps1_pr2_u4_o2_N1.lp ...
Solving...
Optimization: 2
Answer: 1
init(object(order,1),value(pickingStation,1)). init(object(order,2),value(pickingStation,1)). init(object(node,1),value(at,(1,1))). init(object(node,2),value(at,(2,1))). init(object(node,3),value(at,(1,2))). init(object(node,4),value(at,(2,2))). init(object(order,1),value(line,(1,1))). init(object(order,2),value(line,(2,3))). init(object(pickingStation,1),value(at,(2,1))). init(object(product,1),value(on,(1,1))). init(object(product,2),value(on,(1,3))). init(object(robot,1),value(at,(1,1))). init(object(robot,2),value(at,(2,1))). init(object(shelf,1),value(at,(2,2))). init(object(shelf,2),value(at,(1,2))). assign(robot(2),shelf(1),station(1)).
OPTIMUM FOUND

Models       : 1
  Optimum    : yes
Optimization : 2
Calls        : 1
Time         : 0.078s (Solving: 0.01s 1st Model: 0.01s Unsat: 0.00s)
CPU Time     : 0.025s

Choices      : 1       
Conflicts    : 1        (Analyzed: 0)
Restarts     : 0       
Model-Level  : 1.0     
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

Rules        : 71      
  Choice     : 4       
  Minimize   : 1       
Atoms        : 63      
Bodies       : 7       
Equivalences : 2        (Atom=Atom: 0 Body=Body: 0 Other: 2)
Tight        : Yes
Variables    : 4        (Eliminated:    0 Frozen:    2)
Constraints  : 5        (Binary:  80.0% Ternary:  20.0% Other:   0.0%)

