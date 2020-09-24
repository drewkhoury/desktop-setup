# Directory Checker

1. save this script somewhere handy like: `/Users/$USER/Desktop/perf`

2. create a folder to store results: `mkdir /Users/$USER/Desktop/perf/dirtest`

3. run in background (timelimit=86400 means this runs for 24 hours):

`sh /Users/$USER/Desktop/perf/dirtest.sh > /dev/null 2>&1 &`

4. you can turn the result into a csv:

```
LATEST_FILE=$(ls -Art /Users/$USER/Desktop/perf/dirtest/ | tail -n 1)

# skip labels real, user, sys
awk ' { print $1, $2, $4, $6 } ' OFS=, /Users/$USER/Desktop/perf/dirtest/$LATEST_FILE
```

# Load Checker

1. save this script somewhere handy like: `/Users/$USER/Desktop/perf`

2. create a folder to store results: `mkdir /Users/$USER/Desktop/perf/load`

3. run in background (timelimit=86400 means this runs for 24 hours):

`sh /Users/$USER/Desktop/perf/load-checker.sh > /dev/null 2>&1 &`

4. you can check things:

```
MY_PATH=/Users/$USER/Desktop/perf/load
LATEST_FILE=$(ls -Art /Users/$USER/Desktop/perf/load/ | tail -n 1)
LATEST_FILE_DATA=${LATEST_FILE}-dataonly.txt
```

## Check Load Averages over time

`cat ${MY_PATH}/${LATEST_FILE} | grep Load`


## Check CPU Usage over time

`cat ${MY_PATH}/${LATEST_FILE} | grep 'CPU usage'`

## Check Memory over time

`cat ${MY_PATH}/${LATEST_FILE} | grep 'PhysMem'`

## Check processes

`cat ${MY_PATH}/${LATEST_FILE_DATA} | grep 'Chrome'`

 


