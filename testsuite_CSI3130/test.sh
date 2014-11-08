#!/bin/bash

#this script expects a postgres server to be running on port 55432
echo Running Tests

bindir="../postgresql-8.1.7/src/test/regress/tmp_check/install/usr/local/pgsql/bin"
libdir="../postgresql-8.1.7/src/test/regress/tmp_check/install/usr/local/pgsql/lib"
port="55432"

# ----------
# Set up shared library paths, needed by psql
# Ripped from pg_regress
# ----------

    if [ -n "$LD_LIBRARY_PATH" ]; then
        LD_LIBRARY_PATH="$libdir:$LD_LIBRARY_PATH"
    else
        LD_LIBRARY_PATH=$libdir
    fi
    export LD_LIBRARY_PATH

    if [ -n "$DYLD_LIBRARY_PATH" ]; then
        DYLD_LIBRARY_PATH="$libdir:$DYLD_LIBRARY_PATH"
    else
        DYLD_LIBRARY_PATH=$libdir
    fi
    export DYLD_LIBRARY_PATH

#disables the other join types 
sed -i -e 's/enable_mergejoin = on/enable_mergejoin = off/g' ../postgresql-8.1.7/src/test/regress/tmp_check/data/postgresql.conf
sed -i -e 's/enable_nestloop = on/enable_nestloop = off/g' ../postgresql-8.1.7/src/test/regress/tmp_check/data/postgresql.conf

"${bindir}/createdb" -p $port testdb

#runs the test sql, assuming the database is called "testdb"
"${bindir}/psql" -p $port -d testdb -a -f testcase_sql.sql

ruby check_results.rb 

"${bindir}/dropdb" -p $port testdb