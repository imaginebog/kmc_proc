#!/bin/bash


function run {
echo started $1 : $(date)
echo ./3d-tracula_bedpost_trac.sh $1
./3d-tracula_bedpost_trac.sh $1 &

}

exec < faltantes_tracula.txt
while read line
do
   while [ $(ps -a | grep 3d-tracula | wc -l) -ge 20 ]
   do
      sleep 10s
   done
   sleep 2s
   run $line
done
