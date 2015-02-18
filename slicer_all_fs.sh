#!/bin/bash

function run {
echo started $1 : $(date)
 ./7-slicer_models.sh $1 &
#./5d-braviz-wrap.sh $1 &
}

cd /media/DATAPART5/kmc400/scripts
exec < faltantes_slicer.txt 
while read line
do
    while [ $(ps -a | grep 7-slicer_mod | wc -l) -ge 14 ]
    do
        sleep 10s
    done
    run $line
    sleep 2s
done
