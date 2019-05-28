#!/usr/bin/env python
#-*- coding: utf-8 -*-


import os

inputDir = 'output_ilpAssignModels/'
outputDir = 'testInst'

print('reading from:')
for i in os.listdir(os.path.join(inputDir)):
    for j in os.listdir(os.path.join(inputDir,i)):
        for k in os.listdir(os.path.join(inputDir,i,j)):
            if (k == 'results'):
                for l in os.listdir(os.path.join(inputDir,i,j,k)):
                    for m in os.listdir(os.path.join(inputDir,i,j,k,l)):
                        for n in os.listdir(os.path.join(inputDir,i,j,k,l,m)):
                            for o in os.listdir(os.path.join(inputDir,i,j,k,l,m,n)):
                                for p in os.listdir(os.path.join(inputDir,i,j,k,l,m,n,o)):
                                    if (p == 'runsolver.solver'):
                                        fileName = os.path.join(inputDir,i,j,k,l,m,n,o,p)
                                        if(True):
#                                        if os.path.isfile(fileName):
                                            print(fileName)
                                            file = open(fileName,'r')
                                            
                                            for line in file:
                                                if 'INTERRUPTED' in line:
                                                    break
                                                if 'Calls' in line:
                                                    out = open(os.path.join(outputDir,(n + '__' + m.split('_')[1] + '__hor')),'a')
                                                    out.write('#const horizon = ' + str(int((line.split(':')[1]).split('\n')[0])-1) + '.\n')
                                                    out.close()
                                            file.close()


                                        
