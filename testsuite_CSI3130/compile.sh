#!/bin/bash

cd ../postgresql-8.1.7/src

echo "Compiling nodeHash.c"
gcc -fsyntax-only -I./include ./backend/executor/nodeHash.c

echo "Compiling nodeHashjoin.c"
gcc -fsyntax-only -I./include ./backend/executor/nodeHashjoin.c

echo "Compiling createplan.c"
gcc -fsyntax-only -I./include ./backend/optimizer/plan/createplan.c

cd ../../testsuite_CSI3130