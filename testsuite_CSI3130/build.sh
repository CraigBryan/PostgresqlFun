#!/bin/bash
cd ../postgresql-8.1.7
echo Building and Installing Postgres
make clean
./configure
make
make install

cd ../testsuite_CSI3130