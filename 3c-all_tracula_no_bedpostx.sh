#!/bin/bash


function run {
echo started $1 : $(date)
echo ./3-tracula.sh $1
./3-tracula.sh $1 &

}

exec < faltantes_freesurfer.txt
while read line
do
   while [ $(ps -a | grep 3b-tracula | wc -l) -ge 10 ]
   do
      sleep 10s
   done
   sleep 2s
   run $line
done
