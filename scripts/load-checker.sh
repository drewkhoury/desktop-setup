#!/bin/bash

filepath=/Users/$USER/Desktop/perf/load-super   # modify as desired
timelimit=86400                      # how long to run, in seconds
mydatetime=`date +%F_%H-%M-%S`
myfile=$filepath/$mydatetime.txt

while [ "$SECONDS" -le "$timelimit" ] ; do
  echo '' >> $myfile
  echo "Date: $mydatetime" >> $myfile
  top -l3 -n3 > load-test-data-tmp ; tail -n15 ./load-test-data-tmp  >> $myfile
  sleep 10
done
