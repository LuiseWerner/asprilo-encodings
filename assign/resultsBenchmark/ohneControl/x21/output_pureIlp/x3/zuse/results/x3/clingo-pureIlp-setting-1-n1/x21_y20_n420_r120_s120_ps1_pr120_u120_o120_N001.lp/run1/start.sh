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
	"../../../../../../../../programs/clingo-pureIlp" ../../../../../../../../benchmarks/assign/currentInst/x21_y20_n420_r120_s120_ps1_pr120_u120_o120_N001.lp '--stats 1 --out-atomf=%s.'

touch .finished
