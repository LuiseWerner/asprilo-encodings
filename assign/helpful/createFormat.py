#!/usr/bin/env python
#-*- coding: utf-8 -*-


import os
import sys

out = open(sys.argv[1],'a')

x_length = int(sys.argv[2])
y_length = int(sys.argv[3])
xStorage_length = int(sys.argv[4])
yStorage_length = int(sys.argv[5])
nodes = []
highways = []
stations = []
nodeCount = 1
highwayCount = 1

y = 1
while (y <= y_length):
    x = 1
    aisleHelp = 0
    while (x <= x_length):
        coord = [int(x),int(y)]
        nodes.append(coord)

        if y == 1:
            if (x != int((x_length+1)/2)):
                highways.append(coord)
            else:
                stations.append(coord)
        if y == 2:
            highways.append(coord)
        if (y > 2) and (y <= yStorage_length + 2):
            if (x == 1) or (x == 1 + ((xStorage_length + 1)*aisleHelp)):
                highways.append(coord)
                aisleHelp += 1
        if (y == yStorage_length + 3) or (y == yStorage_length + 4):
            highways.append(coord)

        x += 1
    y += 1
    
highways = sorted(sorted(highways, key=lambda tup: tup[0]), key = lambda tup: tup[1])
nodes = sorted(sorted(nodes, key=lambda tup: tup[0]), key = lambda tup: tup[1])

for i in nodes:
    out.write('init(object(node,' + str(nodeCount) + '),value(at,(' + str(i[0]) + ',' + str(i[1]) + '))).\n')
    nodeCount += 1
for i in highways:
    out.write('init(object(highway,' + str(highwayCount) + '),value(at,(' + str(i[0]) + ',' + str(i[1]) + '))).\n')
    highwayCount += 1 
for i in stations:
    out.write('init(object(pickingStation,1),value(at,(' + str(i[0]) + ',' + str(i[1]) + '))).\n')


out.close()
