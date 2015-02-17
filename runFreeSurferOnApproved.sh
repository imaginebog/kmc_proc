#!/bin/bash

function run {
echo started $1 : $(date)
date > logs/freeSurfer_$1.txt
echo =============== >> logs/freeSurfer_$1.txt
echo ./2-freeSurfer.sh $1 >> logs/freeSurfer_$1.txt 2>&1 
./2-freeSurfer.sh $1 >> logs/freeSurfer_$1.txt 2>&1 &
}

cd /media/DATAPART5/kmc400/scripts
mkdir logs
exec < approved.txt
while read line
do
while [ $(ps | grep 2-freeSurfer.sh | wc -l) -ge 11 ]
do
sleep 10m
done
run $line
done