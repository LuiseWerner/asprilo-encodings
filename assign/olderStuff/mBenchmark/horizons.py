#!/usr/bin/env python
#-*- coding: utf-8 -*-

import os
import subprocess

inputFile = open('allAssignments.lp','r')
helpFileName = 'assignSet.lp'
instanceName = '../Instances/moo/structured/1x2x4/100sc/r05/x11_y6_n66_r5_s16_ps1_pr16_u16_o5_N001.lp'
outputFilePattern = 'Answers/Answer'

invokeClingo = False
answerCount = 0
for line in inputFile:
    if(invokeClingo):
        helpFile = open(helpFileName,'w')
        helpFile.write(line)
        helpFile.close()
        outputFile = outputFilePattern + str(answerCount) + '.lp'
        command = 'clingo ../../m/encoding.ilp ../control-m/control.ilp ' + helpFileName + ' ' + instanceName + ' --out-atomf=%s. --stats > ' + outputFile
        print(command)
        subprocess.call(command, shell = True)
        out = open(outputFile,'a')
        out.write(line + '\n')
    if 'Answer' in line:
        invokeClingo = True
        answerCount = answerCount + 1
    else:
        invokeClingo = False

inputFile.close()
helpFile.close()

for file in os.listdir('Answers'):
    f = open(os.path.join('Answers',file),'r')
    for line in f:
        if 'Calls' in line:
            print(line)
    f.close()
