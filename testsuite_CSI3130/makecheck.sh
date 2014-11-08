#!/bin/bash

#wrapper for regression tests
cd ../postgresql-8.1.7

make check

cd ../testsuite_CSI3130