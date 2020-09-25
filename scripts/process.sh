#!/bin/bash

filepath=/Users/$USER/Desktop/perf/logs/process   # modify as desired
interval=20                         # reports per minute
timelimit=86400                      # how long to run, in seconds

mydate=`date "+%H:%M:%S"`           # the timestamp
mydatetime=`date +%F_%H-%M-%S`
myday=`date +%F`
freq=$((60/$interval))              # for sleep function

while [ "$SECONDS" -le "$timelimit" ] ; do
  echo "process detail invoked"
  ps -p$1 -opid -opcpu -ocomm -c | grep $1 | sed "s/^/$mydatetime /" >> $filepath/$myday-$2.txt
  sleep 10
  mydate=`date "+%H:%M:%S"`
done
