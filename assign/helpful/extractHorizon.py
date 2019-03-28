#!/usr/bin/env python
#-*- coding: utf-8 -*-


import os

outputDir = 'output_horizon'
os.system('mkdir ' + outputDir)

for dir in os.listdir('files'):
    file = open(os.path.join('files',dir,'run1/runsolver.solver'),'r')
    
    for line in file:
        if 'Calls' in line:
            out = open(os.path.join(outputDir,dir),'a')
            out.write(line.split(':')[1])
            out.close()
    file.close()
