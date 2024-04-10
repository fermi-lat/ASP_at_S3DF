set -xe

opt1="(${TSTART} <= nMetStart && nMetStop <= ${TSTOP})"
opt2="(nMetStart <= ${TSTART} && ${TSTART} <= nMetStop)"
opt3="(nMetStart <= ${TSTOP} && ${TSTOP} <= nMetStop)"
time_query="(${opt1} || ${opt2} || ${opt3})"

(/sdf/home/g/glast/a/datacat/prod/datacat find --group FT1 --filter "$time_query" ${folder}) > ${OUTPUTDIR}/Ft1FileList

(/sdf/home/g/glast/a/datacat/prod/datacat find --group FT2 --filter "$time_query" ${folder}) > ${OUTPUTDIR}/Ft2FileList

logical_path=${pgwave_folder}/${frequency}
file_list=${OUTPUTDIR}/pgwaveFileList
pgw_query="nDatasetId==${pgwave_streamId} && $time_query"
(/sdf/home/g/glast/a/datacat/prod/datacat --mode DEV find --group PGWAVESOURCELIST --filter "$pgw_query" ${logical_path}) > ${file_list}

if [ -z "$(cat ${file_list})" ]
then
    echo "File ${file_list} is empty."
    exit 1
fi
