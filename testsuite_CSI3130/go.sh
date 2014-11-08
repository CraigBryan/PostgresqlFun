#!/bin/bash

#builds postgres from source
./build.sh 

#installs an local temporary version of postgres and starts the server
./install.sh

#runs the tests
./test.sh

#cleans up
./cleanup.sh