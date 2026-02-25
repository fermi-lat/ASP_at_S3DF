#!/usr/bin/bash

#export PIPELINE_SUMMARY=pipeline_summary
#export folder=/Data/Flight/Level1/LPA
#OUTPUTDIR=.
#nDownlink=240901000

#query="DataType == \"FT1\" && nDownlink == ${nDownlink}"
#echo "query=" $query
# NICO changed this:
query="nDownlink == ${nDownlink}"
echo "query=" $query

vars=`/sdf/home/g/glast/a/datacat/prod/datacat --mode ${PIPELINESERVER} find --group FT1 --filter "$query" --display nMetStart --display nMetStop ${folder}`

echo "vars:" $vars
nMetStart=`echo $vars | cut -f2 -d " "`
nMetStop=`echo $vars | cut -f3 -d " "`
if [ $nMetStart ] && [ $nMetStop ]
   then
       echo "PipelineCreateStream.insertIntervalsTask.-1 nMetStart=$nMetStart, nMetStop=$nMetStop" >> ${PIPELINE_SUMMARY}
fi
