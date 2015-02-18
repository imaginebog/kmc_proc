#!/bin/bash


function run {
echo started $1 : $(date)
echo ./4-SPM_preproc.sh $1 $2
./4-SPM_preproc_new.sh $1 $2 &

}

exec < faltantes_totales_spm_no_repeat.txt
while read line
do
   while [ $(ps -a | grep 4-SPM_preproc_new | wc -l) -ge 10 ]
   do
      sleep 1m
   done
   sleep 2s
   run $line
done
