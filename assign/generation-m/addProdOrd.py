#!/usr/bin/env python
#-*- coding: utf-8 -*-


import sys

file = open(sys.argv[1],'r')
out = open(sys.argv[2],'a')

highways = []
nodes = []
numProdOrd = int(sys.argv[3])
prodOrdCount = 1

for line in file:
    out.write(line)

while (prodOrdCount <= numProdOrd):
    out.write('init(object(product,' + str(prodOrdCount) + '),value(on,(' + str(prodOrdCount) + ',1))).\n')
    out.write('init(object(order,' + str(prodOrdCount) + '),value(line,(' + str(prodOrdCount) + ',1))).\n')
    out.write('init(object(order,' + str(prodOrdCount) + '),value(pickingStation,1)).\n')
    prodOrdCount += 1

out.close()          
file.close()
