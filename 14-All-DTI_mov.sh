#!/bin/bash

function run {
./14-DTI_mov.sh $1 &
}

exec < faltantes_dti_mov.txt
while read subj
do
   while [ $(ps -a | grep 14-DTI_mov | wc -l) -ge 18 ]
   do
      sleep 3s
   done
   sleep 2s
   run $subj
done
