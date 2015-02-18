#!/bin/bash


function run {
echo started $1 : $(date)
echo ./3-tracula.sh $1
./3-tracula.sh $1 &

}

exec < invalidos_tracula.txt
while read line
do
   while [ $(ps -a | grep 3-tracula | wc -l) -ge 14 ]
   do
      sleep 60s
   done
   sleep 60s
   run $line
done
