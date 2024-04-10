#!/bin/sh
#set -xe

export INST_DIR=/sdf/data/fermi/a/ground/ASP/prod/ASP-07-00-00
export SCRIPT_DIR=/sdf/data/fermi/a/ground/ASP/prod/ASP_at_S3DF/pipeline_scripts
export CATDIR=/sdf/data/fermi/a/ground/ASP/catalogs

#
# Check that requested time interval is covered by FT1 and FT2 files.
#
singularity exec --bind /sdf:/sdf,/sdf/group/fermi/sw/containers/rhel6/afs:/afs /sdf/group/fermi/sw/containers/fermi-rhel6.20230922.sif bash ${SCRIPT_DIR}/check_interval_coverage.sh

interval_file=${SLURM_SUBMIT_DIR}/launch_pgwave_info.txt
while IFS= read -r line; do
    interval=`echo $line | cut -f1 -d " "`
    frequency=`echo $line | cut -f2 -d " "`
    tstart=`echo $line | cut -f3 -d " "`
    tstop=`echo $line | cut -f4 -d " "`
    streamId=`echo $line | cut -f5 -d " "`
    OUTPUTDIR=`echo $line | cut -f6 -d " "`
    args="folder=${folder},interval=${interval},frequency=${frequency},TSTART=${tstart},TSTOP=${tstop},OUTPUTDIR=${OUTPUTDIR},CATDIR=${CATDIR},ASP_PGWAVEROOT=${INST_DIR},PIPELINE_USER=glastraw,PIPELINESERVER=DEV,datacatalog_imp=datacatalog"
    /sdf/home/g/glast/a/pipeline-II/prod/pipeline \
         -m ${PIPELINESERVER} createStream \
         -S ${streamId} \
         -D ${args} \
         PGWave
done < "$interval_file"
