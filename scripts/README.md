# TL/DR

A collection of scripts to help collect diagnostic information.


1. Copy the scripts somewhere on your computer, like `/Users/$USER/Desktop/perf/scripts` then ensure you have a logs folder, ie `/Users/$USER/Desktop/perf/logs`.

2. Run the scripts in the background each morning to collect new data:

```
sh /Users/$USER/Desktop/perf/scripts/dirtest.sh > /dev/null 2>&1 &
sh /Users/$USER/Desktop/perf/scripts/load-checker.sh > /dev/null 2>&1 &
sh /Users/$USER/Desktop/perf/scripts/process-details.sh > /dev/null 2>&1 &
```

# Directory Checker

You can turn the result into a csv for further analysis:

```
LATEST_FILE=$(ls -Art /Users/$USER/Desktop/perf/dirtest/ | tail -n 1)

# skip labels real, user, sys
awk ' { print $1, $2, $4, $6 } ' OFS=, /Users/$USER/Desktop/perf/dirtest/$LATEST_FILE
```

# Load Checker

You can check things using some simple grep'ing:

```
# get the log files...

MY_PATH=/Users/$USER/Desktop/perf/logs/load
LATEST_FILE=$(ls -Art ${MY_PATH} | tail -n 1)

MY_PATH_DATA=/Users/$USER/Desktop/perf/logs/load-data
LATEST_FILE_DATA=$(ls -Art ${MY_PATH_DATA} | tail -n 1)
```

## Check Load Averages over time

`cat ${MY_PATH}/${LATEST_FILE} | grep Load`


## Check CPU Usage over time

`cat ${MY_PATH}/${LATEST_FILE} | grep 'CPU usage'`

## Check Memory over time

`cat ${MY_PATH}/${LATEST_FILE} | grep 'PhysMem'`

## Check processes

`cat ${MY_PATH}/${LATEST_FILE_DATA} | grep 'Chrome'`

 


