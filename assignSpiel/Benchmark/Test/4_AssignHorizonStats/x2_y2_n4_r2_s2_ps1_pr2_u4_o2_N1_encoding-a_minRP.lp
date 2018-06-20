clingo version 5.2.2
Reading from ...2_ps1_pr2_u4_o2_N1_encoding-a_minRP.lp ...
Solving...
Solving...
Solving...
Solving...
Solving...
Solving...
Solving...
Solving...
Answer: 1
init(object(order,1),value(pickingStation,1)) init(object(order,2),value(pickingStation,1)) init(object(node,1),value(at,(1,1))) init(object(node,2),value(at,(2,1))) init(object(node,3),value(at,(1,2))) init(object(node,4),value(at,(2,2))) init(object(order,1),value(line,(1,1))) init(object(order,2),value(line,(2,3))) init(object(pickingStation,1),value(at,(2,1))) init(object(product,1),value(on,(1,1))) init(object(product,2),value(on,(1,3))) init(object(robot,1),value(at,(1,1))) init(object(robot,2),value(at,(2,1))) init(object(shelf,1),value(at,(2,2))) init(object(shelf,2),value(at,(1,2))) occurs(object(robot,2),action(move,(0,1)),1) occurs(object(robot,2),action(pickup,()),2) occurs(object(robot,2),action(move,(0,-1)),3) occurs(object(robot,2),action(deliver,(2,2,3)),4) occurs(object(robot,2),action(deliver,(1,1,1)),5) occurs(object(robot,2),action(move,(0,1)),6) occurs(object(robot,2),action(putdown,()),7)
SATISFIABLE

Models       : 1+
Calls        : 8
Time         : 0.323s (Solving: 0.01s 1st Model: 0.00s Unsat: 0.01s)
CPU Time     : 0.158s

Choices      : 27      
Conflicts    : 17       (Analyzed: 13)
Restarts     : 0       
Model-Level  : 3.0     
Problems     : 8        (Average Length: 2.00 Splits: 0)
Lemmas       : 13       (Deleted: 0)
  Binary     : 2        (Ratio:  15.38%)
  Ternary    : 5        (Ratio:  38.46%)
  Conflict   : 13       (Average Length:    3.2 Ratio: 100.00%) 
  Loop       : 0        (Average Length:    0.0 Ratio:   0.00%) 
  Other      : 0        (Average Length:    0.0 Ratio:   0.00%) 
Backjumps    : 13       (Average:  2.38 Max:   8 Sum:     31)
  Executed   : 9        (Average:  2.00 Max:   8 Sum:     26 Ratio:  83.87%)
  Bounded    : 4        (Average:  1.25 Max:   2 Sum:      5 Ratio:  16.13%)

Rules        : 2056     (Original: 1771)
  Choice     : 21      
Atoms        : 1209    
Bodies       : 1273     (Original: 994)
  Count      : 0        (Original: 62)
Equivalences : 1609     (Atom=Atom: 394 Body=Body: 128 Other: 1087)
Tight        : Yes
Variables    : 323      (Eliminated:    0 Frozen:    0)
Constraints  : 998      (Binary:  76.2% Ternary:  19.8% Other:   4.0%)

