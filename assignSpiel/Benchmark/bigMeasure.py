#!/usr/bin/env python
#-*- coding: utf-8 -*-

import csv
import os
from timeit import default_timer as timer

# prepare csv-file
f = 'measurementsFile.csv'
csv = open(f, 'w')
columnTitleRow = 'domain, encoding, instance, ilp-time, timeout, horizon, lp-time, timeout, assign, model-time, timeout, ilp-time, timeout, horizon, lp-time, timeout, lp-time, timeout\n'
csv.write(columnTitleRow)
csv.close()

# delete old directories and their contents, create new
dirList = list(['1_MinHorizonStats', '2a_MinHorizonPlansStats', '2b_MinHorizonPlans', '3a_AssignModelsStats', '3b_AssignModels', '4_AssignHorizonStats', '5a_AssignPlansStats', '5b_AssignPlans', '6a_AssignHorizonPlansStats', '6b_AssignHorizonPlans'])
for dir in dirList:
    os.system('rm ' + dir + ' -r')
    os.system('mkdir ' + dir)

# Paths
workingPath = '/home/luiwerner/Mount/Asprilo/asprilo-encodings'
benchmarkPath = os.path.join(workingPath, 'assignSpiel/Benchmark')
examples_a_Path = os.path.join(benchmarkPath, 'examples_a')
examples_m_Path = os.path.join(benchmarkPath, 'examples_m')
assignPath = os.path.join(workingPath, 'assignments')
mhPath = os.path.join(benchmarkPath, 'mh.lp')

minHorizonStatsDir = os.path.join(benchmarkPath, '1_MinHorizonStats')
minHorizonPlansStatsDir = os.path.join(benchmarkPath, '2a_MinHorizonPlansStats')
minHorizonPlansDir = os.path.join(benchmarkPath, '2b_MinHorizonPlans')
assignModelsStatsDir = os.path.join(benchmarkPath, '3a_AssignModelsStats')
assignModelsDir = os.path.join(benchmarkPath, '3b_AssignModels')
assignHorizonStatsDir = os.path.join(benchmarkPath, '4_AssignHorizonStats')
assignPlansStatsDir = os.path.join(benchmarkPath, '5a_AssignPlansStats')
assignPlansDir = os.path.join(benchmarkPath, '5b_AssignPlans')
assignHorizonPlansStatsDir = os.path.join(benchmarkPath, '6a_AssignHorizonPlansStats')
assignHorizonPlansDir = os.path.join(benchmarkPath, '6b_AssignHorizonPlans')

# set timeouts
timeout1 = '1800' # '3600'
timeout2 = '60' # '60'
timeout3 = '30' # '30'
timeout4 = '1800' # '3600'
timeout5 = '60' # '60'
timeout6 = '60' # '60'
timeouts = [timeout1, timeout2, timeout3, timeout4, timeout5, timeout6]
for i in timeouts:
    print(i)

def getHorizonAndTime(currentFileWithDir):
    horizonIn = open(currentFileWithDir, 'r')
    time = '-'
    timeout = '2'
    horizon = '-'
    for line in horizonIn:
        if(('TIME LIMIT' in line) or ('INTERRUPTED' in line)):
            return '-', '1', '-'
    horizonIn.close()
    
    horizonIn = open(currentFileWithDir, 'r')
    for line in horizonIn:
        if('Calls' in line):
            woerter = line.split(':')
            horizon = str(int(woerter[1]) - 1)
        if('Time' in line):
            time = line.split(':')[1].split("(")[0]
            print(time)
            timeout = '0'
            break
    horizonIn.close()    
    return time, timeout, horizon

def getPlanAndTime(currentFilesWithDir):
    planIn = open(currentFilesWithDir[0], 'r')
    planOut = open(currentFilesWithDir[1] , 'w')
    time = '-'
    timeout = '2'
    safeNextLine = False
    for line in planIn:
        if(('TIME LIMIT' in line) or ('INTERRUPTED' in line)):
            return '-', '1'
    planIn.close()
    
    planIn = open(currentFilesWithDir[0], 'r')
    for line in planIn:
        if(safeNextLine):
            planOut.write(line)
            safeNextLine = False
        if('Answer' in line):
            safeNextLine = True
        if('Time' in line):
            time = line.split(':')[1].split("(")[0]
            print(time)
            timeout = '0'
            break
    planIn.close()
    planOut.close()
    return time, timeout


"""
three big iterations:
1: Examples from a + encodings-a,
2: Examples from m + encodings-a,
3: Examples from m + encodings-m
"""
for bigIteration in range(1,4):
    print('bigIteration is ' + str(bigIteration)) 
    domain = 'A'
    encoding = 'A'
    examplesPath = examples_a_Path
    encoding_ilp = 'abc/encoding-a.ilp'
    encoding_lp = 'abc/encoding-a.lp'
    control_ilp = 'control/control-abc.ilp'
    control_lp = 'control/control-abc.lp'
    if(bigIteration > 1):
        domain = 'M'
        print('\n---domain ist: \t' + domain)
        examplesPath = examples_m_Path
    if(bigIteration > 2):
        encoding = 'M'
        print('\n---encoding ist: \t' + encoding)
        encoding_ilp = 'm/encoding.ilp'
        encoding_lp = 'm/encoding.lp'
        control_ilp = 'control/control-m.ilp'
        control_lp = 'control/control-m.lp'
        print('\n---domain ist: \t' + domain)
        print('\n---encoding ist: \t' + encoding)
                
    # Paths
    encoding_ilp_Path = os.path.join(workingPath, encoding_ilp)
    encoding_lp_Path = os.path.join(workingPath, encoding_lp)
    control_ilp_Path = os.path.join(workingPath, control_ilp)
    control_lp_Path = os.path.join(workingPath, control_lp)
    
    # iterate over instances
    i = 0
    for example in os.listdir(examplesPath):
        i = i+1
        j = 0
        horizon = '-'
        horizonSet = {''}
        print("\n------------------------\nInstanz Nr. " + str(i) + ": " + example + "\n------------------------\n")
        row = domain + ', ' + encoding + ', ' + example
        
        exampleFile = os.path.join(examplesPath, example)
        structuredFilename = domain + '_' + example.split('.')[0] + '_' + encoding_ilp.split('/')[1].split('.')[0] + '.lp'

        # min. horizon (using instance and encoding)
        currentDir = minHorizonStatsDir
        currentFileWithDir = os.path.join(currentDir, structuredFilename)
#        command = 'clingo ' + exampleFile + ' ' + encoding_ilp_Path + ' --stats --time-limit=3600 > ' + currentFileWithDir
        command = 'clingo ' + exampleFile + ' ' + encoding_ilp_Path + ' --stats --time-limit=' + timeout1 + ' > ' + currentFileWithDir
        print('command: ' + command)
        os.system(command)

        time, timeout, horizon = getHorizonAndTime(currentFileWithDir)
        print(time, timeout, horizon)
        row = row + ', ' + time + ', ' + timeout + ', ' + horizon
        if((horizon!='0') and (horizon != '-')):
            print('Horizont wurde berechnet und ist nicht 0. Horizont ist ' + horizon)
            horizonSet.add(horizon)

            # plan (using min. horizon)
            currentDirs = [minHorizonPlansStatsDir, minHorizonPlansDir]
            currentFilesWithDir = [os.path.join(currentDirs[0], structuredFilename), os.path.join(currentDirs[1], structuredFilename)]
#            command = 'clingo ' + exampleFile + ' ' + encoding_lp_Path + ' -c horizon=' + horizon + ' --out-atomf=%s. --stats --time-limit=60 > ' + currentFilesWithDir[0]
            command = 'clingo ' + exampleFile + ' ' + encoding_lp_Path + ' -c horizon=' + horizon + ' --out-atomf=%s. --stats --time-limit=' + timeout2 + ' > ' + currentFilesWithDir[0]
            print('command: ' + command)
            os.system(command)
            time, timeout = getPlanAndTime(currentFilesWithDir)
            print(time, timeout)
            row = row + ', ' + time + ', ' + timeout

        else:
            row = row + ', -, -'

        minHorizon = horizon

        # write in csv-file
        row = row + '\n'
        csv = open(f, 'a')
        csv.write(row)
        csv.close()
        
        # iterate over assignments
        for assign in os.listdir(assignPath):
            row = ' , , , , , , , '
            j = j+1
            print("\n------------------------\nassign Nr. " + str(j) + ": " + assign + "\n------------------------\n")
            row = row + ', ' + assign
            assignFile = os.path.join(assignPath, assign)
            structuredFilename = domain + '_' + example.split('.')[0] + '_' + encoding_ilp.split('/')[1].split('.')[0] + '_' + assign

            # assignModel
            currentDirs = [assignModelsStatsDir, assignModelsDir]
            currentFilesWithDir = [os.path.join(currentDirs[0], structuredFilename), os.path.join(currentDirs[1], structuredFilename)]
#            command = 'clingo ' + exampleFile + ' ' + assignFile + ' -q1,0 --out-atomf=%s. --stats --time-limit=30 > ' + currentFilesWithDir[0]
            command = 'clingo ' + exampleFile + ' ' + assignFile + ' -q1,0 --out-atomf=%s. --stats --time-limit=' + timeout3 + ' > ' + currentFilesWithDir[0]
            print('command: ' + command)
            os.system(command)

            time, timeout = getPlanAndTime(currentFilesWithDir)
            print(time, timeout)
            row = row + ', ' + time + ', ' + timeout

            # if assignModel exists
            if(os.stat(currentFilesWithDir[1]).st_size != 0):
                print('model exists')
                modelWithPath = os.path.join(assignModelsDir,structuredFilename)
                                
                # horizon (using assignModel)
                currentDir = assignHorizonStatsDir
                currentFileWithDir = os.path.join(currentDir, structuredFilename)
                horizon = minHorizon
                if((horizon != '-') and (horizon != '0')):
#                    command = 'clingo ' + modelWithPath + ' ' + encoding_ilp_Path + ' ' + control_ilp_Path + ' ' + mhPath + ' -c mh=' + horizon + ' --stats --time-limit=3600 > ' + currentFileWithDir
                    command = 'clingo ' + modelWithPath + ' ' + encoding_ilp_Path + ' ' + control_ilp_Path + ' ' + mhPath + ' -c mh=' + horizon + ' --stats --time-limit=' + timeout4 + ' > ' + currentFileWithDir
                else:
#                    command = 'clingo ' + modelWithPath + ' ' + encoding_ilp_Path + ' ' + control_ilp_Path + ' --stats --time-limit=3600 > ' + currentFileWithDir
                    command = 'clingo ' + modelWithPath + ' ' + encoding_ilp_Path + ' ' + control_ilp_Path + ' --stats --time-limit=' + timeout4 + ' > ' + currentFileWithDir
                print('command: ' + command)
                os.system(command)

                time, timeout, horizon = getHorizonAndTime(currentFileWithDir)
                print(time, timeout, horizon)
                row = row + ', ' + time + ', ' + timeout + ', ' + horizon
                if((horizon!='0') and (horizon!='-')):
                    print('Horizont konnte berechnet werden und ist nicht 0. Horizont ist ' + horizon)
                    
                    # plan (using horizon)
                    currentDirs = [assignPlansStatsDir, assignPlansDir]
                    currentFilesWithDir = [os.path.join(currentDirs[0], structuredFilename), os.path.join(currentDirs[1], structuredFilename)]
#                    command = 'clingo ' + modelWithPath + ' ' + encoding_lp_Path + ' ' + control_lp_Path + ' -c horizon=' + horizon + ' --out-atomf=%s. --stats --time-limit=60 > ' + currentFilesWithDir[0]
                    command = 'clingo ' + modelWithPath + ' ' + encoding_lp_Path + ' ' + control_lp_Path + ' -c horizon=' + horizon + ' --out-atomf=%s. --stats --time-limit=' + timeout5 + ' > ' + currentFilesWithDir[0]
                    print('command: ' + command)
                    os.system(command)
                    time, timeout = getPlanAndTime(currentFilesWithDir)
                    print(time, timeout)
                    row = row + ', ' + time + ', ' + timeout

                    # plan without assignModel (using min. horizon)
                    if horizon in horizonSet:
                        row = row + ', redundant, redundant'
                    else:
                        horizonSet.add(horizon)
                        currentDirs = [assignHorizonPlansStatsDir, assignHorizonPlansDir]
                        currentFilesWithDir = [os.path.join(currentDirs[0], structuredFilename), os.path.join(currentDirs[1], structuredFilename)]
#                        command = 'clingo ' + exampleFile + ' ' + encoding_lp_Path + ' -c horizon=' + horizon + ' --out-atomf=%s. --stats --time-limit=60 > ' + currentFilesWithDir[0]
                        command = 'clingo ' + exampleFile + ' ' + encoding_lp_Path + ' -c horizon=' + horizon + ' --out-atomf=%s. --stats --time-limit=' + timeout6 + ' > ' + currentFilesWithDir[0]
                        print('command: ' + command)
                        os.system(command)
                        time, timeout = getPlanAndTime(currentFilesWithDir)
                        print(time, timeout)
                        row = row + ', ' + time + ', ' + timeout

                else:
                    row = row + ', -, -, -, -'
             
            # if no model exists
            else:
                row = row + ', -, -, -, -, -, -, -'
                print('no model')
            
            # write in csv-file
            row = row + '\n'
            print(row)
            csv = open(f, 'a')
            csv.write(row)
            csv.close()
        
print("finished")
