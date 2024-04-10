set -xe
frequency=six_hours
interval=33977
tstart=733881600
tstop=733903200

/sdf/home/g/glast/a/pipeline-II/prod/pipeline \
    -m DEV \
    createStream -S -1 \
    -D folder=/Data/Flight/Level1/LPA,interval=${interval},frequency=${frequency},nMetStart=${tstart},nMetStop=${tstop},GRBOUTPUT=/sdf/group/fermi/ground/PipelineOutput/ASP_test/Results/GRB,DRPOUTPUTDIR=/sdf/group/fermi/ground/PipelineOutput/ASP_test/Results/DRP,PGWAVEOUTPUTDIR=/sdf/group/fermi/ground/PipelineOutput/ASP_test/Results/PGWAVE,PIPELINESERVER=DEV,ASPLAUNCHERROOT=/sdf/data/fermi/a/ground/ASP/prod/ASP-07-00-00,datacatalog_imp=datacatalog \
    AspLauncher
