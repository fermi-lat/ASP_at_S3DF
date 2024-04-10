frequency=six_hours
interval=33977
tstart=733881600
tstop=733903200

/sdf/home/g/glast/a/pipeline-II/prod/pipeline \
    --mode DEV \
    createStream \
    -S -1 \
    --define ASP_PGWAVEROOT=/sdf/data/fermi/a/ground/ASP/prod/ASP-07-00-00,CATDIR=/sdf/data/fermi/a/ground/ASP/catalogs,datacatalog_imp=datacatalog,folder=/Data/Flight/Level1/LPA,frequency=${frequency},interval=${interval},OUTPUTDIR=/sdf/group/fermi/ground/PipelineOutput/ASP_test/Results/PGWAVE/six_hours/${interval},PIPELINE_USER=glastraw,PIPELINESERVER=DEV,TSTART=${tstart},TSTOP=${tstop} \
    PGWave
