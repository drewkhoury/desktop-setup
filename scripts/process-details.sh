#!/bin/bash

filepath=/Users/$USER/Desktop/perf/logs/load   # modify as desired
scriptpath=/Users/$USER/Desktop/perf/scripts
process_logs=/Users/$USER/Desktop/perf/logs/process
timelimit=86400                      # how long to run, in seconds
mydate=`date "+%H:%M:%S"`           # the timestamp
mydatetime=`date +%F_%H-%M-%S`
myday=`date +%F`

# run for the day, grab the latest "process offenders file" and get a unique list of pids,
# track details for each process (each loop might introduce new processes, that's good!)
while [ "$SECONDS" -le "$timelimit" ] ; do

  echo "starting"
  LATEST_FILE=$(ls -Art ${filepath} | tail -n 1)
  for i in $(cat ${filepath}/$LATEST_FILE | awk '{print $1}' | grep -x -E '[[:digit:]]+' | grep -v '2020-' | grep -v '2020/' | sort | uniq -u); do
    echo "$i"

    PROCESS_NAME=$(ps c -p $i -o comm=| tr -d "[:space:]")

    # make process name the id if we can't find the name
    if test -z "$PROCESS_NAME"
    then
          PROCESS_NAME=$i
    fi

    echo $PROCESS_NAME
    echo ""


    if test -f "${process_logs}/$myday-$PROCESS_NAME"; then
      echo 'file exists, we are already tracking, so skipping the invocation...'
    else

      # only monitor if the pid exists
      if ps -p $i > /dev/null
      then
         echo "starting process detail for (running process) $i / $PROCESS_NAME"
         sh ${scriptpath}/process.sh $i $PROCESS_NAME > /dev/null 2>&1 &
      fi

    fi
  done

  sleep 600

done
