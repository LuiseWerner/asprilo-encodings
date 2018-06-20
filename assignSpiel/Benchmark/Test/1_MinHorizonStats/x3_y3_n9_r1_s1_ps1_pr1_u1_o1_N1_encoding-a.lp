clingo version 5.2.2
Reading from ...s_a/x3_y3_n9_r1_s1_ps1_pr1_u1_o1_N1.lp ...
Solving...
Solving...
Solving...
Solving...
Solving...
Solving...
Solving...
Solving...
Solving...
Solving...
Solving...
Solving...
Answer: 1
init(object(order,1),value(pickingStation,1)) init(object(node,1),value(at,(1,1))) init(object(node,2),value(at,(2,1))) init(object(node,3),value(at,(3,1))) init(object(node,4),value(at,(1,2))) init(object(node,5),value(at,(2,2))) init(object(node,6),value(at,(3,2))) init(object(node,7),value(at,(1,3))) init(object(node,8),value(at,(2,3))) init(object(node,9),value(at,(3,3))) init(object(order,1),value(line,(1,1))) init(object(pickingStation,1),value(at,(1,3))) init(object(product,1),value(on,(1,1))) init(object(robot,1),value(at,(2,3))) init(object(shelf,1),value(at,(3,1))) occurs(object(robot,1),action(move,(1,0)),1) occurs(object(robot,1),action(move,(0,-1)),2) occurs(object(robot,1),action(move,(0,-1)),3) occurs(object(robot,1),action(pickup,()),4) occurs(object(robot,1),action(move,(-1,0)),5) occurs(object(robot,1),action(move,(0,1)),6) occurs(object(robot,1),action(move,(0,1)),7) occurs(object(robot,1),action(move,(-1,0)),8) occurs(object(robot,1),action(deliver,(1,1,1)),9) occurs(object(robot,1),action(move,(1,0)),10) occurs(object(robot,1),action(putdown,()),11)
SATISFIABLE

Models       : 1+
Calls        : 12
Time         : 1.035s (Solving: 0.06s 1st Model: 0.01s Unsat: 0.05s)
CPU Time     : 0.636s

Choices      : 72      
Conflicts    : 36       (Analyzed: 30)
Restarts     : 0       
Model-Level  : 17.0    
Problems     : 12       (Average Length: 2.00 Splits: 0)
Lemmas       : 30       (Deleted: 0)
  Binary     : 9        (Ratio:  30.00%)
  Ternary    : 6        (Ratio:  20.00%)
  Conflict   : 30       (Average Length:    4.1 Ratio: 100.00%) 
  Loop       : 0        (Average Length:    0.0 Ratio:   0.00%) 
  Other      : 0        (Average Length:    0.0 Ratio:   0.00%) 
Backjumps    : 30       (Average:  2.20 Max:   7 Sum:     66)
  Executed   : 22       (Average:  1.90 Max:   6 Sum:     57 Ratio:  86.36%)
  Bounded    : 8        (Average:  1.12 Max:   2 Sum:      9 Ratio:  13.64%)

Rules        : 3297     (Original: 2630)
  Choice     : 22      
Atoms        : 1947     (Original: 1769 Auxiliary: 178)
Bodies       : 2263     (Original: 1787)
  Count      : 6        (Original: 55)
Equivalences : 3130     (Atom=Atom: 911 Body=Body: 86 Other: 2133)
Tight        : Yes
Variables    : 983      (Eliminated:    0 Frozen:   36)
Constraints  : 3321     (Binary:  72.8% Ternary:  23.7% Other:   3.6%)

