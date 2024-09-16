#!/bin/sh
export INST_DIR=/sdf/group/fermi/ground/PipelineConfig/ASP/ASP-07-00-00
export OUR_BINDIR=$INST_DIR/bin/redhat6-x86_64-64bit-gcc44-Optimized

source ${INST_DIR}/ASP_containerSettings/asp_presetup.sh
source ${OUR_BINDIR}/_setup_s3df.sh
source ${INST_DIR}/ASP_containerSettings/asp_postsetup.sh

python $SCRIPT_DIR/unhandled_asp_intervals.py "$@"
