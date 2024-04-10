setenv BINDIR redhat6-x86_64-64bit-gcc44-Optimized
setenv GLASTGROUND /sdf/data/fermi/a/ground
setenv INST_DIR ${GLASTGROUND}/ASP/prod/ASP-07-00-00
setenv GLAST_EXT ${GLASTGROUND}/GLAST_EXT/redhat6-x86_64-64bit-gcc44
#astrotools

source ${INST_DIR}/bin/${BINDIR}/_setup_s3df.csh
setenv TNS_ADMIN /sdf/home/g/glast/a/oracle/admin
#setenv ORACLE_HOME /sdf/data/fermi/user/jchiang/singularity_tests/oracle/11.1.0
setenv ORACLE_HOME /afs/slac.stanford.edu/package/oracle/f/11.1.0/amd64_linux26/11.1.0
setenv LD_LIBRARY_PATH ${ORACLE_HOME}/lib:${LD_LIBRARY_PATH}

setenv GPL2 /sdf/data/fermi/user/jchiang/dev/GPLtools
setenv GPLTOOLS_PATH ${GPL2}/python

setenv PYTHONPATH ${GPLTOOLS_PATH}:${GLASTGROUND}/PipelineConfig/ASP/python/lib/python2.6_x86_64/site-packages:${PYTHONPATH}
setenv PATH ${INST_DIR}/bin/${BINDIR}:${PATH}
setenv PFILES ".;${BASE_DIR}/syspfiles:/dev/null"
setenv CALDB ${GLASTGROUND}/ASP/prod/fermitools_irfs/irfs/caldb/CALDB
setenv CALDBCONFIG ${CALDB}/software/tools/caldb.config
setenv CALDBALIAS ${CALDB}/software/tools/alias_config.fits

