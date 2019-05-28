#!/usr/bin/env python
#-*- coding: utf-8 -*-


import os

instances = []
assignCodes = []
timeLines = []
timesIlp = []
timesLp = []
hors = []

inputDir = 'files'
def extractTimes(inputDir):
    for i in os.listdir(inputDir):
        for dir in os.listdir(os.path.join(inputDir,i)):
            file = open(os.path.join(inputDir,i,dir,'run1/runsolver.solver'),'r')
            safeTime = False

            for line in file:
                if(safeTime):
                    if ('Time' in line) and not ('CPU' in line):
                        timeLines.append(str(os.path.join(i,dir)) + " " + line)
                if (('INTERRUPTED' in line) or ('UNKNOWN' in line) or ('UNSAT' in line)):
                    break
                if 'SATISFIABLE' in line:
                    safeTime = True
            file.close()

def writeTable(ilp):
    if (ilp):
        times = timesIlp
        adjust = 0
    else:
        times = timesLp
        adjust = len(assignCodes)

    for i in range(len(assignCodes)):
        outLines.append(str(assignCodes[i]) + ';')
        for j in range(len(instances)):
            timeAdded = False
            for k in range(len(times)):
                if((('_' + str(assignCodes[i]) + '/') in times[k]) and (str(instances[j]) in times[k])):
                    currentTime = ((times[k].split(':')[1]).split('s')[0]).replace('.',',')
                    outLines[i+2+adjust] += str(currentTime) + ';0;' + hors[i*len(instances) + j] + ';'
                    timeAdded = True
            if not (timeAdded):
                outLines[i+2+adjust] += ';1;-;'

# create list of instances
for fileName in os.listdir('testInst'):
    if (('.lp' in fileName) and ('__' not in fileName)):
        instances.append(fileName)

# create list of assignCodes
for file in os.listdir('encodings/assignCode'):
    assignCodes.append(file.split('.lp')[0])
assignCodes.sort()
assignCodes.insert(0,'noAsg')

# create list of horizons       
for i in range(len(assignCodes)):
    for j in range(len(instances)):
        horAdded = False
        for fileName in os.listdir('testInst'):
            if ('hor' in fileName):
                if (('__' + assignCodes[i] + '__' in fileName) and (instances[j] in fileName)):
                    file = open(os.path.join('testInst',fileName))
                    for line in file:
                        if 'horizon' in line:
                            hors.append((line.split('= ')[1]).split('.')[0])
                            horAdded = True
#                            continue
        if not (horAdded):
            hors.append('-')
#for i in hors:
#    print(i)

# extractTimes
extractTimes('output_ilpAssignModels/moo-asg/zuse/results/moo')
extractTimes('output_lpAssignModels/moo-asg/zuse/results/moo')


# sort times by ilp and lp
ilp = 1
for line in timeLines:
    if ('-ilp' in line) or ('pureIlp' in line):
        timesIlp.append(line)
    if ('-lp' in line) or ('pureLp' in line):
        timesLp.append(line)

# create table
os.system('rm overview.csv')
out = open('overview.csv','w')
outLines = []
# not: outLines.append(';;')
outLines.append(';')
outLines.append(';')

for i in range(len(instances)):
    outLines[0] += str(instances[i]) + ';;;'
    outLines[1] += 'time;broken;horizon;'

# write times and horizons in table, 1 for ilp, 0 for lp
writeTable(1)
writeTable(0)

for i in range(len(outLines)):
    out.write(outLines[i] + '\n')

out.close()
