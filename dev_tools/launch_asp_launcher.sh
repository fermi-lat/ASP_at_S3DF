set -xe
frequency=six_hours
interval=34579
tstart=746884800
tstop=746906400

/sdf/group/fermi/sw/pipeline-II/dev/pipeline \
    -m DEV \
    createStream -S -1 \
    -D folder=/Data/Flight/Level1/LPA,interval=${interval},frequency=${frequency},TSTART=${tstart},TSTOP=${tstop},GRBOUTPUT=/sdf/data/fermi/ground/PipelineOutput/ASP_test/Results/GRB,DRPOUTPUTDIR=/sdf/data/fermi/ground/PipelineOutput/ASP_test/Results/DRP,PGWAVEOUTPUTDIR=/sdf/data/fermi/ground/PipelineOutput/ASP_test/Results/PGWAVE,PIPELINESERVER=DEV,ASPLAUNCHERROOT=/sdf/group/fermi/ground/PipelineConfig/ASP/ASP-07-00-00,datacatalog_imp=datacatalog \
    AspLauncher
