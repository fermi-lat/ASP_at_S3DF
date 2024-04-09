set -xe

/sdf/home/g/glast/a/pipeline-II/prod/pipeline \
    -m DEV \
    createStream -S -1 \
    -D folder=/Data/Flight/Level1/LPA,interval=33977,frequency=six_hours,nMetStart=733881600,nMetStop=733903200,GRBOUTPUT=/sdf/group/fermi/ground/PipelineOutput/ASP_test/Results/GRB,DRPOUTPUTDIR=/sdf/group/fermi/ground/PipelineOutput/ASP_test/Results/DRP,PGWAVEOUTPUTDIR=/sdf/group/fermi/ground/PipelineOutput/ASP_test/Results/PGWAVE,PIPELINESERVER=DEV,ASPLAUNCHERROOT=/sdf/data/fermi/a/ground/ASP/prod/ASP-07-00-00,datacatalog_imp=datacatalog \
    AspLauncher
