#!/bin/bash

function run {
echo started $1 : $(date)
./5d-braviz-wrap.sh $1 &
}

cd /media/DATAPART5/kmc400/scripts 
while read line
do
while [ $(ps | grep 5d-braviz-wrap | wc -l) -ge 5 ]
do
sleep 1m
done
run $line
sleep 10s
done
