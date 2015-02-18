#!/bin/bash


function run {
echo started $1 : $(date)
echo ./5b-First_Level_Others.sh $1
./5b-First_Level_Others.sh $1 COORDINACIONSENSE &

}

exec < left2runCOORDINACION.txt
while read line
do
   while [ $(ps -a | grep 5b-First | wc -l) -ge 2 ]
   do
      sleep 1m
   done
   sleep 2s
   run $line
done
