#!/bin/bash


function run {
echo started $1 : $(date)
echo ./3-tracula_just_trac.sh $1
./3-tracula_just_trac.sh $1 &

}

exec < faltantes_tracula.txt
while read line
do
   while [ $(ps -a | grep 3-tracula | wc -l) -ge 20 ]
   do
      sleep 10s
   done
   sleep 2s
   run $line
done
