#!/bin/bash

function run {
echo started $1 : $(date)
date > logs/SPM_pre_$1.txt
echo =============== >> logs/SPM_pre_$1.txt
echo ./4-SPM_preproc.sh $1 >> logs/SPM_pre_$1.txt 2>&1 
./4-SPM_preproc.sh $1 >> logs/SPM_pre_$1.txt 2>&1 &
}

cd /media/DATAPART5/kmc400/scripts
mkdir logs
exec < approved.txt
while read line
do
while [ $(ps | grep 4-SPM_preproc | wc -l) -ge 4 ]
do
sleep 5m
done
sleep 1m
run $line
done
