#!/bin/bash

function run {
echo started $1 : $(date)
# ./7-slicer_models.sh $1 &
./5d-braviz-wrap.sh $1 &
}

cd /media/DATAPART5/kmc400/scripts
exec < left2runFS.txt 
while read line
do
while [ $(ps -a | grep 7-slicer_models.sh | wc -l) -ge 14 ]
do
sleep 1m
done
run $line
sleep 2s
done
