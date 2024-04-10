#!/bin/sh
#set -xe

if [ -z "$folder" ] || [ -z "$nDownlink" ] || [ -z "$PIPELINESERVER" ]
    then
        echo "PIPELINESERVER, folder, and nDownlink environment variables must be set"
        exit 1
fi

export INST_DIR=/sdf/data/fermi/a/ground/ASP/prod/ASP-07-00-00
export SCRIPT_DIR=/sdf/data/fermi/a/ground/ASP/prod/ASP_at_S3DF/pipeline_scripts
export OUTPUT_DIR=/sdf/group/fermi/ground/PipelineOutput/ASP/Results

#
# AspInsertIntervals
#
/sdf/home/g/glast/a/pipeline-II/prod/pipeline \
    -m ${PIPELINESERVER} createStream \
    -S -1 \
    -D "folder=${folder},nDownlink=${nDownlink},PIPELINESERVER=${PIPELINESERVER},ASPLAUNCHERROOT=${INST_DIR},datacatalog_imp=datacatalog" \
    AspInsertIntervals

#
# AspLauncher.  This needs to run over all unhandled intervals for all
# frequencies.
#
# The first step is to run a wrapped python script from within the
# singularity container to determine those intervals and write them to
# temporary file.
singularity exec --bind /sdf:/sdf,/sdf/group/fermi/sw/containers/rhel6/afs:/afs /sdf/group/fermi/sw/containers/fermi-rhel6.20230922.sif ${SCRIPT_DIR}/unhandled_asp_intervals.sh
#
# Read in the intervals, loop over them, and launch streams for each.
#
interval_file="intervals_${nDownlink}.txt"
cat "$interval_file"
while IFS= read -r line; do
    interval=`echo $line | cut -f1 -d " "`
    frequency=`echo $line | cut -f2 -d " "`
    tstart=`echo $line | cut -f3 -d " "`
    tstop=`echo $line | cut -f4 -d " "`
    /sdf/home/g/glast/a/pipeline-II/prod/pipeline \
        -m ${PIPELINESERVER} createStream \
        -S -1 \
        -D "folder=${folder},interval=${interval},frequency=${frequency},TSTART=${tstart},TSTOP=${tstop},GRBOUTPUT=${OUTPUT_DIR}/GRB,DRPOUTPUTDIR=${OUTPUT_DIR}/DRP,PGWAVEOUTPUTDIR=${OUTPUT_DIR}/PGWAVE,PIPELINESERVER=${PIPELINESERVER},ASPLAUNCHERROOT=${INST_DIR},datacatalog_imp=datacatalog" \
        AspLauncher
done < "$interval_file"
#
# Clean up the interval file.
#
rm "$interval_file"

##
## GRB_blind_search.  This may raise a duplicate stream
## exception, keep it at the end of the script so other streams can be
## launched.
##
#GRBROOTDIR=/sdf/group/fermi/ground/PipelineOutput/ASP_test/Results/GRB
#echo /sdf/home/g/glast/a/pipeline-II/prod/pipeline \
#    -m ${PIPELINESERVER} createStream \
#    -S -1 \
#    -D "DownlinkId=${nDownlink},GRBROOTDIR=${GRBROOTDIR},GRBASPROOT=${INST_DIR},datacatalog_imp=datacatalog,folder=${folder}" \
#    GRB_blind_search
