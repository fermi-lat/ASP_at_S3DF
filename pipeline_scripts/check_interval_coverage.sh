#!/bin/sh
export INST_DIR=/sdf/data/fermi/a/ground/ASP/prod/ASP-07-00-00
export OUR_BINDIR=$INST_DIR/bin/redhat6-x86_64-64bit-gcc44-Optimized

source /sdf/data/fermi/a/ground/ASP/prod/ASP-07-00-00/ASP_containerSettings/asp_presetup.sh
source ${OUR_BINDIR}/_setup_s3df.sh
source /sdf/data/fermi/a/ground/ASP/prod/ASP-07-00-00/ASP_containerSettings/asp_postsetup.sh

python $SCRIPT_DIR/check_interval_coverage.py "$@"
