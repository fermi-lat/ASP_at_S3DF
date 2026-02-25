set -xe

opt1="(${TSTART} <= nMetStart && nMetStop <= ${TSTOP})"
opt2="(nMetStart <= ${TSTART} && ${TSTART} <= nMetStop)"
opt3="(nMetStart <= ${TSTOP} && ${TSTOP} <= nMetStop)"
time_query="(${opt1} || ${opt2} || ${opt3})"
delay=300
waited=0

# 2026-01-27 Michael Kuss
# polling in a loop, because about once a day catalogQuery is faster than filling the datacat
for i in $(seq 16); do
    (/sdf/home/g/glast/a/datacat/prod/datacat find --mode ${PIPELINESERVER} --group FT1 --filter "$time_query" ${folder}) > ${OUTPUTDIR}/Ft1FileList

    (/sdf/home/g/glast/a/datacat/prod/datacat find --mode ${PIPELINESERVER} --group FT2 --filter "$time_query" ${folder}) > ${OUTPUTDIR}/Ft2FileList

    logical_path=${pgwave_folder}/${frequency}
    file_list=${OUTPUTDIR}/pgwaveFileList
    pgw_query="nDatasetId==${pgwave_streamId} && $time_query"
    # should we adda sleep here?  NO, NOT HERE! MWK
    (/sdf/home/g/glast/a/datacat/prod/datacat find --mode ${PIPELINESERVER} --group PGWAVESOURCELIST --filter "$pgw_query" ${logical_path}) > ${file_list}

    if [ -z "$(cat ${file_list})" ]
    then
	echo "$(date) File ${file_list} is empty."
	waited=$[waited+delay]
	sleep $delay
    else
	[ $waited -gt 0 ] && echo "Waited $[waited/60] minutes for non-empty ${file_list}!"
	exit 0
    fi
done

if [ -z "$(cat ${file_list})" ]
then
    echo "File ${file_list} is empty."
    exit 1
fi
