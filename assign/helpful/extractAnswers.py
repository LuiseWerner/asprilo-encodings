#!/usr/bin/env python
#-*- coding: utf-8 -*-


import os

inputDir = 'files'
outputDir = 'output_Answers'
os.system('mkdir ' + outputDir)

for i in os.listdir(inputDir):
    os.system('mkdir ' + os.path.join(outputDir,i))
    for dir in os.listdir(os.path.join(inputDir,i)):
        file = open(os.path.join(inputDir,i,dir,'run1/runsolver.solver'),'r')
        safeLine = False
    
        for line in file:
            if(safeLine):
                out = open(os.path.join(outputDir,i,dir),'a')
                out.write(line)
                out.close()
                break
            if 'Answer' in line:
                safeLine = True
        file.close()
