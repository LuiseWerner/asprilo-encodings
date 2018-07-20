#!/usr/bin/env python
#-*- coding: utf-8 -*-

import csv
import os
import subprocess
from timeit import default_timer as timer

# set timeouts
timeout1 = '7200'
timeouts = [timeout1]
for i in timeouts:
    print(i)

# prepare csv-file
f = 'measurementsFile.csv'
csv = open(f, 'w')
columnTitleRow = 'domain, encoding, instance, ilp-time, timeout ' + timeout1 + ', horizon\n'
csv.write(columnTitleRow)
csv.close()

# delete old directories and their contents, create new
dirList = list(['1_MinHorizonStats'])
for dir in dirList:
    os.system('rm ' + dir + ' -r')
    os.system('mkdir ' + dir)
    
# Paths
workingPath = '/home/luiwerner/Mount/Asprilo/asprilo-encodings'
benchmarkPath = os.path.join(workingPath, 'assignSpiel/Benchmark')
examples_a_Path = os.path.join(benchmarkPath, 'examplesA')
examples_m_Path = os.path.join(benchmarkPath, 'examplesM')

minHorizonStatsDir = os.path.join(benchmarkPath, '1_MinHorizonStats')

def getHorizonAndTime(currentFileWithDir):
    horizonIn = open(currentFileWithDir, 'r')
    time = '-'
    timeout = '2'
    horizon = '-'
    for line in horizonIn:
        if(('TIME LIMIT' in line) or ('INTERRUPTED' in line)):
            horizonIn.close()
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

"""
three big iterations:
1: Examples from a + encodings-a,
2: Examples from m + encodings-a,
3: Examples from m + encodings-m
"""
#for bigIteration in range(1,4):
for bigIteration in range(1,3):
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
        command = 'clingo ' + exampleFile + ' ' + encoding_ilp_Path + ' --stats --time-limit=' + timeout1 + ' > ' + currentFileWithDir
        print('command: ' + command)
        subprocess.call(command, shell=True)

        time, timeout, horizon = getHorizonAndTime(currentFileWithDir)
        print(time, timeout, horizon)
        row = row + ', ' + time + ', ' + timeout + ', ' + horizon

        # write in csv-file
        row = row + '\n'
        csv = open(f, 'a')
        csv.write(row)
        csv.close()
         
print("finished")
