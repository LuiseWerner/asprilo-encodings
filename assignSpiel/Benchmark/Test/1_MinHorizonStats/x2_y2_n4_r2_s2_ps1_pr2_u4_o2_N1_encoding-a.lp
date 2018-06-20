clingo version 5.2.2
Reading from ...s_a/x2_y2_n4_r2_s2_ps1_pr2_u4_o2_N1.lp ...
Solving...
Solving...
Solving...
Solving...
Solving...
Solving...
Solving...
Solving...
Answer: 1
init(object(order,1),value(pickingStation,1)) init(object(order,2),value(pickingStation,1)) init(object(node,1),value(at,(1,1))) init(object(node,2),value(at,(2,1))) init(object(node,3),value(at,(1,2))) init(object(node,4),value(at,(2,2))) init(object(order,1),value(line,(1,1))) init(object(order,2),value(line,(2,3))) init(object(pickingStation,1),value(at,(2,1))) init(object(product,1),value(on,(1,1))) init(object(product,2),value(on,(1,3))) init(object(robot,1),value(at,(1,1))) init(object(robot,2),value(at,(2,1))) init(object(shelf,1),value(at,(2,2))) init(object(shelf,2),value(at,(1,2))) occurs(object(robot,2),action(move,(0,1)),1) occurs(object(robot,2),action(pickup,()),2) occurs(object(robot,2),action(move,(0,-1)),3) occurs(object(robot,2),action(deliver,(1,1,1)),4) occurs(object(robot,1),action(move,(0,1)),5) occurs(object(robot,2),action(deliver,(2,2,3)),5) occurs(object(robot,2),action(move,(0,1)),6) occurs(object(robot,2),action(putdown,()),7)
SATISFIABLE

Models       : 1+
Calls        : 8
Time         : 0.341s (Solving: 0.02s 1st Model: 0.00s Unsat: 0.02s)
CPU Time     : 0.199s

Choices      : 46      
Conflicts    : 19       (Analyzed: 15)
Restarts     : 0       
Model-Level  : 17.0    
Problems     : 8        (Average Length: 2.00 Splits: 0)
Lemmas       : 15       (Deleted: 0)
  Binary     : 0        (Ratio:   0.00%)
  Ternary    : 2        (Ratio:  13.33%)
  Conflict   : 15       (Average Length:    4.8 Ratio: 100.00%) 
  Loop       : 0        (Average Length:    0.0 Ratio:   0.00%) 
  Other      : 0        (Average Length:    0.0 Ratio:   0.00%) 
Backjumps    : 15       (Average:  2.53 Max:   8 Sum:     38)
  Executed   : 10       (Average:  2.07 Max:   8 Sum:     31 Ratio:  81.58%)
  Bounded    : 5        (Average:  1.40 Max:   2 Sum:      7 Ratio:  18.42%)

Rules        : 2919     (Original: 2428)
  Choice     : 21      
Atoms        : 1479     (Original: 1373 Auxiliary: 106)
Bodies       : 2014     (Original: 1636)
  Count      : 0        (Original: 75)
Equivalences : 1761     (Atom=Atom: 485 Body=Body: 110 Other: 1166)
Tight        : Yes
Variables    : 941      (Eliminated:    0 Frozen:    0)
Constraints  : 3206     (Binary:  71.7% Ternary:  22.7% Other:   5.6%)

