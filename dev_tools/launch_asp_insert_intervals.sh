nDownlink=240901011
/sdf/group/fermi/sw/pipeline-II/dev/pipeline \
    --mode DEV \
    createStream \
    -S -1 \
    --define "folder=/Data/Flight/Level1/LPA,PIPELINESERVER=DEV,ASPLAUNCHERROOT=/sdf/group/fermi/ground/PipelineConfig/ASP/ASP-07-00-00,nDownlink=${nDownlink}" \
    AspInsertIntervals
