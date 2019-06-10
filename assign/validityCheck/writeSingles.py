#!/usr/bin/env python
#-*- coding: utf-8 -*-

import os

file = open('x5_allAsgs.lp','r')
safeAnswer = 0
for line in file:
    if(safeAnswer > 0):
        out = open(os.path.join('singles',str(safeAnswer) + '.lp'),'w')
        out.write(line)
        out.close()
        safeAnswer = 0
    if('Answer' in line):
        safeAnswer = int(line.split(': ')[1])
        
