#!/usr/bin/env python
#-*- coding: utf-8 -*-

import csv
import os
from timeit import default_timer as timer

f = "measurementsFile.csv"
csv = open(f, "w")
columnTitleRow = "instance, assign, time1, timeout1, time2, timeout2, horizon, time3, timeout3\n"
csv.write(columnTitleRow)

workingPath = "/home/luiwerner/Mount/Asprilo/asprilo-encodings"
examplesPath = os.path.join(workingPath, "assignSpiel/Benchmark/examples")
assignPath = os.path.join(workingPath, "assignments")

#über Instanzen iterieren
i = 0
for example in os.listdir(examplesPath):
    print("\n------------------------\nInstanz: " + example + "\n-----------------------\n")
    exampleFile = os.path.join(examplesPath, example)
    i = i+1
    j = 0
    horizon = None
    
    #über Assignments iterieren
    for assign in os.listdir(assignPath):
        print("\n------------------------\nassign: " + assign + "\n-----------------------\n")
        row = example + ", " + assign
        j = j+1
        assignFile = os.path.join(assignPath, assign)
        assignment = 'assignment_' + str(i) + "_" + str(j) + '.txt'
        assignModel = 'assignModel_' + str(i) + "_" + str(j) + '.lp'
        horizonStats = 'horizonStats_' + str(i) + "_" + str(j) + '.txt'
              
        # Berechnung Assignment aus assign und example
        commandAssign = 'clingo ' + assignFile + ' ' + exampleFile + ' -q1,0 --time-limit=1800 --out-atomf=%s. > ' + assignment
        print("Aufruf assign: " + commandAssign)
        start1 = timer()
        os.system(commandAssign)
        end1 = timer()
        time1 = (end1 - start1)
        row = row + ", " + str(time1) + ", TODO"

        # Assignment in in weiterverarbeitbare Form bringen
        assignIn = open(assignment, "r")
        assignOut = open(assignModel, "w")
        safeNextLine = False
        for line in assignIn:
            if(safeNextLine):
                assignOut.write(line)
                safeNextLine = False
            if("Answer" in line):
                safeNextLine = True
        assignIn.close()
        os.remove(assignment)
        assignOut.close()

        # Horizont mit mit inkrementellem Modus berechnen
        commandHorizon = 'clingo ' + assignModel + ' ' + os.path.join(workingPath, "abc/encoding-a.ilp") + ' ' + os.path.join(workingPath, "control/control-abc.ilp") + ' --time-limit=3 --stats > ' + horizonStats
        print("Aufruf horizon: " + commandHorizon)
        start2 = timer()
        os.system(commandHorizon)
        end2 = timer()
        time2 = (end2 - start2)
        row = row + ", " + str(time2)
        
        # Horizont rausziehen
        horizonIn = open(horizonStats, "r")
        for line in horizonIn:
            if("TIME LIMIT" in line):
                print("timeout")
                #"timeout = 1", "horizon = -" in Zeile schreiben
                row = row + ", 1, -"
                break
            else:
                if("Calls" in line):
                    woerter = line.split(":")
                    horizon = int(woerter[1]) - 1
                    print("Horizont ist " + str(horizon))
                    #"timeout = 0", horizon in Zeile schreiben
                    row = row + ", 0, " + str(horizon)
                    break
        horizonIn.close()
        os.remove(horizonStats)
        
        # Zeitberechnung mit vorher berechnetem Horizont
        if(horizon != None):
            print("Horizont konnte berechnet werden")
            commandTime = 'clingo ' + assignModel + ' ' + os.path.join(workingPath, "abc/encoding-a.lp") + ' ' + os.path.join(workingPath, "control/control-abc.lp") + ' -c horizon=' + str(horizon) + ' --time-limit=3 --out-atomf=%s. -q'
            print("Aufruf time: " + commandTime)
            start3 = timer()
            os.system(commandTime)
            end3 = timer()
            time3 = (end3 - start3)
            row = row + ", " + str(time3) + ", TODO"
        else:
            print("Horizont konnte nicht berechnet werden")
            row = row + ", -, -"

        # Ergebnisse in Datei schreiben
        row = row + "\n"
        csv.write(row)
print("fertig")
