import os
from launchStreams import get_interval, createSubDir
from checkLevelOneFiles import providesCoverage
from FileStager import FileStager

min_frac = float(os.environ['minimum_coverage'])

offset = {'six_hours' : 0,
          'daily' : 1,
          'weekly' : 2}

interval, frequency, tstart, tstop = get_interval()
streamId = tstart + offset[frequency]

def prepend_output_dir(filename):
    return os.path.join(os.environ['OUTPUTDIR'], filename)

ft1_file_list = prepend_output_dir('Ft1FileList').replace("launchStreams", "catalogQueries")
ft2_file_list = prepend_output_dir('Ft2FileList').replace("launchStreams", "catalogQueries")
outfile = prepend_output_dir('launch_pgwave_info.txt')
print(tstart, tstop, min_frac, ft1_file_list, ft2_file_list)
fileStager = FileStager(os.environ['PIPELINE_PROCESSINSTANCE'], cleanup=True)
if providesCoverage(tstart, tstop, min_frac, ft1_file_list, ft2_file_list,
                    fileStager=fileStager):
    print("providesCoverage is True. outfile:", outfile)
    if frequency in offset:
        createSubDir(interval, frequency, os.environ['DRPOUTPUTDIR'])
    output_dir = createSubDir(interval, frequency, os.environ['PGWAVEOUTPUTDIR'])
    #
    # Write the interval info to the output file for the pipeline createStream call.
    #
    with open(outfile, 'w') as fobj:
        fobj.write("%s %s %s %s %s\n" % (interval, frequency, tstart, tstop, streamId))
else:
    print("providesCoverage is False. outfile:", outfile)
    #
    # Create an emtpy output file.
    #
    with open(outfile, 'w') as fobj:
        pass
#
# clean up file lists
#
#os.remove(ft1_file_list)
#os.remove(ft2_file_list)
