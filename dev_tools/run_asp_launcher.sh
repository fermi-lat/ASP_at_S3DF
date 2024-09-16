#!/bin/sh

export PIPELINESERVER=DEV
export nDownlink=240406004
export folder=/Data/Flight/Level1/LPA

SCRIPT_DIR=/sdf/group/fermi/ground/PipelineConfig/ASP/ASP_at_S3DF/pipeline_scripts

bash ${SCRIPT_DIR}/asp_launcher.sh
