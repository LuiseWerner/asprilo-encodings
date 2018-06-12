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
planPath = os.path.join(workingPath, "assignSpiel/Benchmark/Plaene")

os.system('rm Plaene -r')
os.system('mkdir Plaene')

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
        assignment = 'assignment_' + str(i) + '_' + str(j) + '.txt'
        assignModel = 'assignModel_' + str(i) + '_' + str(j) + '.lp'
        horizonStats = 'horizonStats_' + str(i) + '_' + str(j) + '.txt'
        planStats = 'planStats_' + str(i) + '_' + str(j) + '.txt'
        plan = 'plan_' + example.split(".")[0] + assign

        # Berechnung Assignment aus assign und example
        commandAssign = 'clingo ' + assignFile + ' ' + exampleFile + ' -q1,0 --time-limit=10 --out-atomf=%s. --stats > ' + assignment
        print("Aufruf assign: " + commandAssign)
        os.system(commandAssign)

        # Zeitmessung mit Clingo und Assignment in in weiterverarbeitbare Form bringen
        assignIn = open(assignment, "r")
        assignOut = open(assignModel, "w")

        safeNextLine = False
        for line in assignIn:
            if(safeNextLine):
                assignOut.write(line)
                safeNextLine = False
            if("Answer" in line):
               safeNextLine = True
            if(("TIME LIMIT" in line) or ("INTERRUPTED" in line)):
                row = row + ",- ,1"
                break
            else:
                if("Time" in line):
                    #Ausgabe in Stats sieht so aus:
                    #Time         : 0.078s (Solving: 0.00s 1st Model: 0.00s Unsat: 0.00s)
                    time = line.split(":")[1].split("(")[0]
                    # gemessene Zeit und timeout = "0" in Zeile schreiben
                    row = row + ", " + str(time) + ", 0"
                    break           
        assignIn.close()
        os.remove(assignment)
        assignOut.close()

        # Horizont mit mit inkrementellem Modus berechnen
        commandHorizon = 'clingo ' + assignModel + ' ' + os.path.join(workingPath, "abc/encoding-a.ilp") + ' ' + os.path.join(workingPath, "control/control-abc.ilp") + ' --time-limit=10 --stats > ' + horizonStats
        print("Aufruf horizon: " + commandHorizon)
        os.system(commandHorizon)
        
        # Horizont rausziehen
        horizonIn = open(horizonStats, "r")
        for line in horizonIn:
            if(("TIME LIMIT" in line) or ("INTERRUPTED" in line)):
                # timeout = "1" in Zeile schreiben
                row = row + ", -, 1"
                break
            else:
                if("Calls" in line):
                    woerter = line.split(":")
                    horizon = int(woerter[1]) - 1
                if ("Time" in line):
                    # Ausgabe in Stats sieht so aus:
                    # Time         : 0.078s (Solving: 0.00s 1st Model: 0.00s Unsat: 0.00s)
                    time = line.split(":")[1].split("(")[0]
                    # gemessene Zeit und timeout = "0" in Zeile schreiben
                    row = row + ", " + str(time) + ", 0"
                    break
        print("Horizont ist " + str(horizon))
        row = row + ", " + str(horizon)
        horizonIn.close()
        os.remove(horizonStats)
        
        # Zeitberechnung mit vorher berechnetem Horizont
        if((horizon != None) and (horizon!=0)):
            print("Horizont konnte berechnet werden und horizon ist nicht 0")

            commandPlan = 'clingo ' + assignModel + ' ' + os.path.join(workingPath, "abc/encoding-a.lp") + ' ' + os.path.join(workingPath, "control/control-abc.lp") + ' -c horizon=' + str(horizon) + ' --time-limit=10 --outf=0 -V0 --out-atomf=%s. --quiet=1,2,2 --stats > ' + planStats
            print("Aufruf Plan: " + commandPlan)
            os.system(commandPlan)
            
            planIn = open(planStats, "r")
            planOut = open(os.path.join(planPath,plan), "w")
            writeLine = True
            for line in planIn:
                if(writeLine):
                    planOut.write(line)
                    writeLine = False
                if(("TIME LIMIT" in line) or ("INTERRUPTED" in line)):
                    row = row + ", -, 1"
                    break
                else:
                    if ("Time" in line):
                        # Ausgabe in Stats sieht so aus:
                        # Time         : 0.078s (Solving: 0.00s 1st Model: 0.00s Unsat: 0.00s)
                        time = line.split(":")[1].split("(")[0]
                        # gemessene Zeit und timeout = "0" in Zeile schreiben
                        row = row + ", " + str(time) + ", 0"
                        break
            planIn.close()
            os.remove(planStats)
        else:
            print("Horizont konnte nicht berechnet werden")
            row = row + ", -, -"
        os.remove(assignModel)

        # Ergebnisse in Datei schreiben
        row = row + "\n"
        csv.write(row)
print("fertig")
