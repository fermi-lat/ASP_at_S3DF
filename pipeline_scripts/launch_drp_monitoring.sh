set -xe

OUTPUTDIR="${OUTPUTDIR/PGWAVE/DRP}"

/sdf/home/g/glast/a/pipeline-II/prod/pipeline \
    -m ${PIPELINESERVER} createStream \
    -S ${pgwave_streamId} \
    -D "datacatalog_imp=${datacatalog_imp},interval=${interval},PIPELINESERVER=${PIPELINESERVER},DRPMONITORINGROOT=${ASP_PGWAVEROOT},frequency=${frequency},TSTART=${TSTART},TSTOP=${TSTOP},folder=${folder},pgwave_streamId=${pgwave_streamId},OUTPUTDIR=${OUTPUTDIR}" DRP_monitoring
