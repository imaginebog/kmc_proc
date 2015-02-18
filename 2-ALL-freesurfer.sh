#!/bin/bash

function run {
echo started $1 : $(date)
./2-freeSurfer.sh $1 &
echo Done $1 : $(date)
}

exec < faltantes_freesurfer.txt
while read line
do
   while [ $(ps -a | grep 2-freeSu | wc -l) -ge 20 ]
   do
      sleep 10s
   done
   sleep 2s
   run $line
done
