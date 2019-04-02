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
	"../../../../../../../../programs/clingo-pureLp" ../../../../../../../../benchmarks/assign/currentInst/x10_y15_n150_r36_s36_ps1_pr36_u36_o36_N001.lp '--stats 1 --out-atomf=%s.'

touch .finished