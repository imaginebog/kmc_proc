#!/bin/bash

function run {
echo started $1 : $(date)
./5d-braviz-wrap.sh $1 &
}

cd /media/DATAPART5/kmc400/scripts
exec < faltantes_wrap.txt 
while read line
do
    while [ $(ps -a | grep 5d-brav | wc -l) -ge 14 ]
    do
        sleep 10s
    done
    run $line
    sleep 2s
done
