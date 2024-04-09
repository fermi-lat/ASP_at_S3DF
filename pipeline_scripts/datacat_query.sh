#!/bin/sh
#
#export folder=/Data/Flight/Level1/LPA
#export TSTART=717120000
#export TSTOP=717141600
if [ -z "$OUTPUTDIR" ]
   then
       export OUTPUTDIR=$SLURM_SUBMIT_DIR
fi
echo $OUTPUTDIR

opt1="(${TSTART} <= nMetStart && nMetStop <= ${TSTOP})"
opt2="(nMetStart <= ${TSTART} && ${TSTART} <= nMetStop)"
opt3="(nMetStart <= ${TSTOP} && ${TSTOP} <= nMetStop)"
query="(${opt1} || ${opt2} || ${opt3})"

echo ${query}
(/sdf/home/g/glast/a/datacat/prod/datacat find --group FT1 --filter "$query" ${folder}) > ${OUTPUTDIR}/Ft1FileList

(/sdf/home/g/glast/a/datacat/prod/datacat find --group FT2 --filter "$query" ${folder}) > ${OUTPUTDIR}/Ft2FileList
