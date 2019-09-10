clingo version 5.4.0
Reading from x5_y5_n25_r3_s1_ps1_pr3_u3_o0_N001.lp ...
Solving...
Answer: 3
distanceSP(shelf(2),station(4),3)
distanceSP(shelf(3),station(1),5)
chain5(shelf(2),3)
chain5(shelf(3),5)
movesSPMax(shelf(3),5)
movesSP(shelf(3),5)
assignSP(shelf(2),station(2))
assignSP(shelf(2),station(3))
assignSP(shelf(2),station(4))
assignSP(shelf(2),station(5))
assignSP(shelf(3),station(1))
distanceSP(shelf(2),station(2),3)
distanceSP(shelf(2),station(3),2)
distanceSP(shelf(2),station(5),4)
chain5(shelf(2),4)
chain5(shelf(2),2)
movesSPMax(shelf(2),4)
assignRS(robot(6),shelf(2))
assignRS(robot(6),shelf(3))
distanceRS(robot(6),shelf(2),2)
distanceRS(robot(6),shelf(3),3)
chain4(robot(6),3)
chain4(robot(6),2)
movesRS(robot(6),2)
movesSP(shelf(2),2)
movesRSP(robot(6),2,7,5,11)
distancePP(station(3),station(2),1)
distancePP(station(4),station(2),2)
distancePP(station(4),station(3),1)
distancePP(station(5),station(2),3)
distancePP(station(5),station(3),2)
distancePP(station(5),station(4),1)
distancePP(station(4),station(5),1)
distancePP(station(3),station(5),2)
distancePP(station(2),station(5),3)
distancePP(station(3),station(4),1)
distancePP(station(2),station(4),2)
distancePP(station(2),station(3),1)
chain3(shelf(2),1)
chain3(shelf(2),2)
chain3(shelf(2),3)
maxDistPP(shelf(2),3)
sum(robot(6),15)
OPTIMUM FOUND

Models       : 3
  Optimum    : yes
Optimization : 15
Calls        : 1
Time         : 0.285s (Solving: 0.01s 1st Model: 0.00s Unsat: 0.01s)
CPU Time     : 0.280s
