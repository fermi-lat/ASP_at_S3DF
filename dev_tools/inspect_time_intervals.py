import databaseAccess as dbAccess

asp_prod = ('/@asp',)
asp_dev = ('/@asp-dev',)

connection = asp_dev

#query = ("select INTERVAL_NUMBER, FREQUENCY, TSTART, TSTOP from TIMEINTERVALS "
#         "where TSTART=733903200 and FREQUENCY='six_hours'")
#query = ("select * from TIMEINTERVALS "
#         "where TSTART>733800000 and FREQUENCY='six_hours'")
query = "select * from TIMEINTERVALS order by TSTART asc"

def print_config(cursor):
    for entry in cursor:
        print(entry)

dbAccess.apply(query, print_config, connection=connection)
