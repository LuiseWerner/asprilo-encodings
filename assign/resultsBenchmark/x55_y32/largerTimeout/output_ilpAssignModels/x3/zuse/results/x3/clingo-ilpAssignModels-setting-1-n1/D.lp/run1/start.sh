#!/bin/bash
# http://www.cril.univ-artois.fr/~roussel/runsolver/

CAT="../../../../../../../../programs/gcat.sh"

cd "$(dirname $0)"

#top -n 1 -b > top.txt

[[ -e .finished ]] || "../../../../../../../../programs/runsolver-3.3.7beta" \
	-M 20000 \
	-w runsolver.watcher \
	-o runsolver.solver \
	-W 36000 \
	"../../../../../../../../programs/clingo-ilpAssignModels" ../../../../../../../../benchmarks/assign/assigned/D.lp '--stats 1 --out-atomf=%s.'

touch .finished
