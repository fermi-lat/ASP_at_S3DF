import os
from date2met import date2met
from intervalAccess import unhandledIntervals

right_now = date2met()

# Cutoff date for interval look-back processing 2019-08-05
met_cutoff = 586656005

unhandled = unhandledIntervals()
intervals_to_process = []
for frequency in unhandled:
    for interval in unhandled[frequency]:
        if interval.tstop > right_now or interval.tstop < met_cutoff:
            # Skip this interval if the current time still precedes
            # the stop time.
            continue
        intervals_to_process.append(interval)

# The nDownlink env var should be unique, since L1Proc will call the
# asp_launcher.sh script once per downlink processing.
outfile = "intervals_%s.txt" % os.environ['nDownlink']
with open(outfile, 'w') as fobj:
    for interval in intervals_to_process:
        fobj.write("%s %s %s %s\n" % (interval.interval, interval.frequency,
                                      interval.tstart, interval.tstop))
