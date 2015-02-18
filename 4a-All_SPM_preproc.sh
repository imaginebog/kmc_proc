#!/bin/bash

function run {
echo started $1 : $(date)
date > logs/DTI_mov_$1.txt
echo =============== >> logs/DTI_mov_$1.txt
echo ./4-SPM_.sh $1 >> logs/DTI_mov_$1.txt 2>&1 
./14-DTI_mov.sh $1 >> logs/DTI_mov_$1.txt 2>&1 &
}

exec < faltantes_dti_mov.txt
while read subj
do
   while [ $(ps -a | grep 14-DTI_mov | wc -l) -ge 12 ]
   do
      sleep 10s
   done
   sleep 2s
   run $subj
done
