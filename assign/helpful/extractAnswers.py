#!/usr/bin/env python
#-*- coding: utf-8 -*-


import os

outputDir = 'output'
os.system('mkdir ' + outputDir)

for dir in os.listdir('files'):
    file = open(os.path.join('files',dir,'run1/runsolver.solver'),'r')
    safeLine = False
    
    for line in file:
        if(safeLine):
            out = open(os.path.join(outputDir,dir),'a')
            out.write(line)
            out.close()
            break
        if 'Answer' in line:
            safeLine = True
    file.close()
