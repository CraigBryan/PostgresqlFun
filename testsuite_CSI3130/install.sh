#!/bin/bash

#This script takes the built postgres and installs a temp version of it
#Then it initializes a db cluster and starts the server on port 55432
cd ../postgresql-8.1.7

#To get this working correctly, I had to cannibalize the pg_regress script
mv ./src/test/regress/pg_regress ./src/test/regress/pg_regress_old -v
cp ../testsuite_CSI3130/pg_regress ./src/test/regress/pg_regress -v
make check
mv ./src/test/regress/pg_regress_old ./src/test/regress/pg_regress -v

cd ../testsuite_CSI3130