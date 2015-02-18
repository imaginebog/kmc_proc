#!/bin/bash


function run {
echo started $1 : $(date)
echo ./4-SPM_preproc.sh $1
./4-SPM_preproc.sh $1 &

}

exec < faltantes.txt
while read line
do
   while [ $(ps -a | grep 4-SPM_preproc | wc -l) -ge 7 ]
   do
      sleep 1m
   done
   sleep 2s
   run $line
done
