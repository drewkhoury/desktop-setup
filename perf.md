
# check how `cd` performs

If you suspect that strange things are happening with your filesystem (like very slow calls to `cd`), measure it! Mac has some strange/old versions of `time` that make this a little tricky but not impossible:

create a folder to store output: `mkdir /Users/$USER/Desktop/perf`

create a file: `cd-script.sh`

```
#!/bin/bash
cd ~
```

create a file: `dirtest.sh`

```
#!/bin/bash

filepath=/Users/$USER/Desktop/perf/dirtest   # modify as desired
interval=20                         # reports per minute
timelimit=86400                      # how long to run, in seconds

mydate=`date "+%H:%M:%S"`           # the timestamp
mydatetime=`date +%F_%H-%M-%S`

freq=$((60/$interval))              # for sleep function

while [ "$SECONDS" -le "$timelimit" ] ; do
  echo '' >> $filepath/$mydatetime.txt
  echo $mydatetime >> $filepath/$mydatetime.txt
  { time sh /Users/drew/Desktop/perf/cd-script.sh ; } 2>> $filepath/$mydatetime.txt
  sleep 10
done
```

run the following each morning to create a new output file:
`sh /Users/$USER/Desktop/perf/dirtest.sh > /dev/null 2>&1 &`



# record top CPU offenders

```
#!/bin/bash

filepath=/Users/$USER/Desktop/perf/load   # modify as desired
interval=20                         # reports per minute
timelimit=86400                      # how long to run, in seconds

mydate=`date "+%H:%M:%S"`           # the timestamp
mydatetime=`date +%F_%H-%M-%S`
freq=$((60/$interval))              # for sleep function

# You need to repeat at least three times to have the correct CPU statistics, which is done by the option -l3.
# I keep the 10 most important jobs, which I extract from the log file with tail.

while [ "$SECONDS" -le "$timelimit" ] ; do
  echo '' >> $filepath/$mydatetime.txt
  echo $mydatetime >> $filepath/$mydatetime.txt
  top -l3 -n10 > load-test-data-tmp ; tail -n22 ./load-test-data-tmp  >> $filepath/$mydatetime.txt
  sleep 10
done


run the following each morning to create a new output file:

```
sh /Users/$USER/Desktop/perf/load-checker.sh > /dev/null 2>&1 &
```

We can do analysis after the fact like so:

```
drew@drews-MacBook-Pro ~ % cat /Users/drew/Desktop/perf/load/2020-09-24_10-36-21.txt | grep Load
Load Avg: 4.63, 4.45, 4.34
Load Avg: 4.40, 4.40, 4.32
Load Avg: 4.24, 4.36, 4.31
Load Avg: 3.89, 4.28, 4.28
```

... and we can get more sophisticated by running this through a small transformation script to display the data in CSV format via a simple loop.
