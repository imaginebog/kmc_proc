#!/bin/bash

function run {
echo starting tracula on subject $1
./3-tracula.sh $1 >> logs/tracula_$1.txt 2>&1 &
}

cd /media/DATAPART5/kmc400/scripts
mkdir logs
exec < approved2.txt
while read line
do
while [ $(ps | grep 3-tracula | wc -l) -ge 11 ]
do
sleep 10m
done
run $line
sleep 1m
done
