set -xe
frequency=six_hours
interval=33977
tstart=733881600
tstop=733903200

/sdf/group/fermi/sw/pipeline-II/dev/pipeline \
    -m DEV \
    createStream -S -1 \
    -D folder=/Data/Flight/Level1/LPA,interval=${interval},frequency=${frequency},nMetStart=${tstart},nMetStop=${tstop},GRBOUTPUT=/sdf/data/fermi/ground/PipelineOutput/ASP_test/Results/GRB,DRPOUTPUTDIR=/sdf/data/fermi/ground/PipelineOutput/ASP_test/Results/DRP,PGWAVEOUTPUTDIR=/sdf/data/fermi/ground/PipelineOutput/ASP_test/Results/PGWAVE,PIPELINESERVER=DEV,ASPLAUNCHERROOT=/sdf/group/fermi/ground/PipelineConfig/ASP/ASP-07-00-00,datacatalog_imp=datacatalog \
    AspLauncher
