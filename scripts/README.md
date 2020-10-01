# TL/DR

A collection of scripts to help collect diagnostic information.

1. Copy the scripts somewhere on your computer, like `/Users/$USER/Desktop/perf/scripts` then ensure you have a logs folder, ie `/Users/$USER/Desktop/perf/logs`.

2. Run the scripts in the background each morning to collect new data:

```
sh /Users/$USER/Desktop/perf/scripts/dirtest.sh > /dev/null 2>&1 &
sh /Users/$USER/Desktop/perf/scripts/load-checker.sh > /dev/null 2>&1 &
sh /Users/$USER/Desktop/perf/scripts/process-details.sh > /dev/null 2>&1 &
```

The looping logic for `process-details.sh` could be much better. Keep an eye on it and if it gets out of hand kill any/all related processes with something like:

```
ps aux | grep '/Users/${USER}/Desktop/perf' | awk '{print $2}' | xargs kill
```

# Directory Checker

Sample output:

```
2020-09-25_09-28-59        0.02 real         0.00 user         0.00 sys
2020-09-25_09-28-59        0.00 real         0.00 user         0.00 sys
2020-09-25_09-28-59        0.06 real         0.00 user         0.00 sys
2020-09-25_09-28-59        0.02 real         0.00 user         0.00 sys
2020-09-25_09-28-59        0.00 real         0.00 user         0.00 sys
```

You can turn the result into a csv for further analysis:

```
LATEST_FILE=$(ls -Art /Users/$USER/Desktop/perf/logs/dirtest/ | tail -n 1)

# skip labels real, user, sys
awk ' { print $1, $2, $4, $6 } ' OFS=, /Users/$USER/Desktop/perf/logs/dirtest/$LATEST_FILE
```

Sample output:

```
2020-09-25_09-28-59,0.05,0.00,0.00
2020-09-25_09-28-59,0.02,0.00,0.00
2020-09-25_09-28-59,0.03,0.00,0.00
2020-09-25_09-28-59,0.02,0.00,0.00
2020-09-25_09-28-59,0.02,0.00,0.00
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

Sample output:

```
Load Avg: 1.66, 2.37, 3.12
Load Avg: 2.83, 2.60, 3.19
Load Avg: 2.62, 2.56, 3.17
Load Avg: 2.45, 2.52, 3.15
Load Avg: 2.35, 2.50, 3.13
```

## Check CPU Usage over time

`cat ${MY_PATH}/${LATEST_FILE} | grep 'CPU usage'`

Sample output:

```
CPU usage: 14.42% user, 9.21% sys, 76.35% idle
CPU usage: 11.3% user, 11.73% sys, 77.23% idle
CPU usage: 12.61% user, 16.90% sys, 70.47% idle
CPU usage: 12.17% user, 9.13% sys, 78.68% idle
CPU usage: 8.59% user, 9.30% sys, 82.10% idle
```


## Check Memory over time

`cat ${MY_PATH}/${LATEST_FILE} | grep 'PhysMem'`

Sample output:

```
PhysMem: 16G used (3284M wired), 105M unused.
PhysMem: 16G used (3272M wired), 208M unused.
PhysMem: 16G used (3246M wired), 212M unused.
PhysMem: 16G used (3291M wired), 106M unused.
PhysMem: 16G used (3262M wired), 157M unused.
```

## Check processes

`cat ${MY_PATH}/${LATEST_FILE_DATA} | grep 'Chrome'`

Sample output:
 
```
92177  Google Chrome He 6.3  sleeping 01:19.67
92177  Google Chrome He 6.3  sleeping 01:20.68
92177  Google Chrome He 15.2 running  01:21.45
73147  Google Chrome    10.9 sleeping 22:58.97
92177  Google Chrome He 4.7  sleeping 01:21.75
```


