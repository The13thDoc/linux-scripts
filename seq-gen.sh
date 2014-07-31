#!/bin/bash

#1234567890 - guide
#10000
#99999
file_name=5 # NUMBER OF DIGITS BEING USED

# set the counter values
max=99999
start=10000

echo '' > $file_name-stats.txt
echo "Min: " $start >> $file_name-stats.txt
echo "Max: " $max >> $file_name-stats.txt

# grab start time
date1=$(date +"%s")

# do the work
seq $start $max | egrep -v '(\w)\1' > $file_name.txt

# grab the end time
date2=$(date +"%s")

# fine the difference
diff=$(($date2-$date1))

echo 'Done.'
# Time, in seconds.
echo "Time: $diff" >> $file_name-stats.txt
