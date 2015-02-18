#!/bin/bash

function run_fs {
# echo "vamos"
echo "started" $1 : $(date)
./2-freeSurfer.sh $1 &
}

cd /media/DATAPART5/kmc400/scripts
# mkdir logs
exec < moraditos_4.txt
while read line
do
while [ $(ps | grep 2-freeSurfer.sh | wc -l) -ge 14 ]
do
sleep 10m
done
echo $line
run_fs $line
sleep 1m
done
