#!/bin/bash

filepath=/Users/$USER/Desktop/perf/logs/load   # modify as desired
filepath2=/Users/$USER/Desktop/perf/logs/load-data   # modify as desired
timelimit=86400                      # how long to run, in seconds
mydatetime=`date +%F_%H-%M-%S`
myfile=$filepath/$mydatetime.txt
myfile2=$filepath2/$mydatetime.txt

while [ "$SECONDS" -le "$timelimit" ] ; do
  echo '' >> $myfile

  mydatetime_loop=`date +%F_%H-%M-%S`

  echo "Date: $mydatetime_loop" >> $myfile

  # l == sample amount
  # n == how many processes
  # tail -n15 will include the 10 summary lines, plus 5 actual data lines

  # everything
  top -l3 -n5 -stats pid,command,cpu,pstate,time > load-test-data-tmp-x ; tail -n15 ./load-test-data-tmp-x  >> $myfile

  # data only
  tail -n15 ./load-test-data-tmp-x | tail -n +11 | sed "s/^/$mydatetime_loop /" >> $myfile2

  sleep 10
done
