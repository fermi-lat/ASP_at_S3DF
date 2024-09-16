set -xe

OUTPUTDIR="${OUTPUTDIR/PGWAVE/DRP}"

pipeline_command=/sdf/group/fermi/sw/pipeline-II/dev/pipeline

${pipeline_command} \
    -m ${PIPELINESERVER} createStream \
    -S ${pgwave_streamId} \
    -D "datacatalog_imp=${datacatalog_imp},interval=${interval},PIPELINESERVER=${PIPELINESERVER},DRPMONITORINGROOT=${ASP_PGWAVEROOT},frequency=${frequency},TSTART=${TSTART},TSTOP=${TSTOP},folder=${folder},pgwave_streamId=${pgwave_streamId},OUTPUTDIR=${OUTPUTDIR}" DRP_monitoring
