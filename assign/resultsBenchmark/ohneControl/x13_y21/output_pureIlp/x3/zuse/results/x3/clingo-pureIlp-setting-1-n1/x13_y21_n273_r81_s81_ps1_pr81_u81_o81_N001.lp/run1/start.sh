#!/bin/bash
# http://www.cril.univ-artois.fr/~roussel/runsolver/

CAT="../../../../../../../../programs/gcat.sh"

cd "$(dirname $0)"

#top -n 1 -b > top.txt

[[ -e .finished ]] || "../../../../../../../../programs/runsolver-3.3.7beta" \
	-M 20000 \
	-w runsolver.watcher \
	-o runsolver.solver \
	-W 300 \
	"../../../../../../../../programs/clingo-pureIlp" ../../../../../../../../benchmarks/assign/currentInst/x13_y21_n273_r81_s81_ps1_pr81_u81_o81_N001.lp '--stats 1 --out-atomf=%s.'

touch .finished
