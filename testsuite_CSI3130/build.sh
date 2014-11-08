#!/bin/bash

#ensuring things are cleaned up
./cleanup.sh

cd ../postgresql-8.1.7
echo Building and Installing Postgres
make clean

if [$OSTYPE = "linux-gnu"]; then
  ./configure CC='gcc-4.7'
else
  ./configure
fi

make

cd ../testsuite_CSI3130