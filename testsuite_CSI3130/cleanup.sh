#!/bin/bash

cd ../postgresql-8.1.7/src/test/regress

#Cleanup script that stops postmaster

#stop postmaster
postmaster_pid=$(cat postmaster_pid.txt) 
kill $postmaster_pid
rm postmaster_pid.txt