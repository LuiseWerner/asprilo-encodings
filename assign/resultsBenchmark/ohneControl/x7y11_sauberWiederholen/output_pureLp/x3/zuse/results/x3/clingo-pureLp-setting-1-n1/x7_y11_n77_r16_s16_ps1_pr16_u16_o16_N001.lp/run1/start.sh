#!/bin/bash
# http://www.cril.univ-artois.fr/~roussel/runsolver/

CAT="../../../../../../../../programs/gcat.sh"

cd "$(dirname $0)"

#top -n 1 -b > top.txt

[[ -e .finished ]] || "../../../../../../../../programs/runsolver-3.3.7beta" \
	-M 20000 \
	-w runsolver.watcher \
	-o runsolver.solver \
	-W 30 \
	"../../../../../../../../programs/clingo-pureLp" ../../../../../../../../benchmarks/assign/currentInst/x7_y11_n77_r16_s16_ps1_pr16_u16_o16_N001.lp '--stats 1 --out-atomf=%s.'

touch .finished
