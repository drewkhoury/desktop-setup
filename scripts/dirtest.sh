#!/bin/bash

filepath=/Users/$USER/Desktop/perf/logs/dirtest   # modify as desired
timelimit=86400                              # how long to run, in seconds
mydatetime=`date +%F_%H-%M-%S`
myfile=$filepath/$mydatetime.txt

while [ "$SECONDS" -le "$timelimit" ] ; do
  printf $mydatetime >> $myfile
  { /usr/bin/time cd ~ ; } 2>> $myfile
  sleep 10
done
