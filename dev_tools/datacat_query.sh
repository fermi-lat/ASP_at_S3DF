#!/bin/sh

export folder=/Data/Flight/Level1/LPA
export TSTART=733881600
export TSTOP=733903200

opt1="(${TSTART} <= nMetStart && nMetStop <= ${TSTOP})"
opt2="(nMetStart <= ${TSTART} && ${TSTART} <= nMetStop)"
opt3="(nMetStart <= ${TSTOP} && ${TSTOP} <= nMetStop)"
query="(${opt1} || ${opt2} || ${opt3})"
echo ${query}

/sdf/home/g/glast/a/datacat/prod/datacat find --group FT1 --filter "$query" ${folder}
