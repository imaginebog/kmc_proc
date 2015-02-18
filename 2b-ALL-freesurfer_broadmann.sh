#!/bin/bash

function run {
echo started $1 : $(date)
./2b-freesurfer_broadmann.sh $1 &
echo Done $1 : $(date)
}

exec < faltantes_freesurfer_broadmann.txt
while read line
do
   while [ $(ps -a | grep 2b-free | wc -l) -ge 22 ]
   do
      sleep 10s
   done
   sleep 2s
   run $line
done
