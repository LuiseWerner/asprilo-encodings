#!/usr/bin/env python
#-*- coding: utf-8 -*-


import os
import sys

file = open(sys.argv[1],'r')
out = open(sys.argv[2],'a')

highways = []
nodes = []
robotCount = 1
shelfCount = 1
numRobots = int(sys.argv[3])
numShelves = numRobots

for line in file:
    out.write(line)
    if ('highway' in line) or ('Station' in line):
        xCoord = ((line.split('(')[4]).split(')')[0]).split(',')[0]
        yCoord = ((line.split('(')[4]).split(')')[0]).split(',')[1]
        coord = [int(xCoord),int(yCoord)]
        highways.append(coord)
    if 'node' in line:
        xCoord = ((line.split('(')[4]).split(')')[0]).split(',')[0]
        yCoord = ((line.split('(')[4]).split(')')[0]).split(',')[1]
        coord = [int(xCoord),int(yCoord)]
        nodes.append(coord)

#sort by x and y
highways = sorted(sorted(highways, key=lambda tup: tup[0]), key = lambda tup: tup[1])
nodes = sorted(sorted(nodes, key=lambda tup: tup[0]), key = lambda tup: tup[1])

for node in nodes:
    if node not in highways:
        if (shelfCount <= numShelves):
            out.write('init(object(shelf,' + str(shelfCount) + '),value(at,(' + str(node[0]) + ',' + str(node[1]) + '))).\n')
            shelfCount += 1
        elif (robotCount <= numRobots):
            out.write('init(object(robot,' + str(robotCount) + '),value(at,(' + str(node[0]) + ',' + str(node[1]) + '))).\n')
            robotCount += 1


out.close()          
file.close()
