
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
