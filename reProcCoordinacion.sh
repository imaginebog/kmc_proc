#!/bin/bash

pdgm=COORDINACIONSENSE 

function run {
echo started $1 : $(date)
echo ./5b-First_Level_Others.sh $1 $pdgm
./5b-First_Level_Others.sh $1 $pdgm &
}

cd /media/DATAPART5/kmc400/scripts
exec < faltantesPabloCOORD.txt
while read line
do
while [ $(ps | grep 5b-First_ | wc -l) -ge 12 ]
do
sleep 1m
done
sleep 2s
run $line
done
