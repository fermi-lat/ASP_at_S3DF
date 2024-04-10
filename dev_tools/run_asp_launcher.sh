#!/bin/sh

export PIPELINESERVER=DEV
export nDownlink=240405005
export folder=/Data/Flight/Level1/LPA

SCRIPT_DIR=/sdf/data/fermi/a/ground/ASP/prod/ASP_at_S3DF/pipeline_scripts

bash ${SCRIPT_DIR}/asp_launcher.sh
