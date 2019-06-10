#!/usr/bin/env python
#-*- coding: utf-8 -*-

import os
import subprocess

basicCommand = 'clingo ../x5_y5_n25_r3_s1_ps1_pr3_u3_o0_N001.lp ../control-c/sp.ilp ../../abc/encoding-c.ilp -q '

for file in os.listdir('singles'):
    command = basicCommand + 'singles/' + file
    print('------------' + file + '-------------')
    subprocess.call(command, shell=True)
