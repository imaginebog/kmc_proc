#!/bin/bash


function run {
echo started $1 : $(date)
echo ./5b-First_Level_Others.sh $1
./5b-First_Level_Others.sh $1 PRENSIONSENSE &

}

exec < left2runPRENSION.txt
while read line
do
   while [ $(ps -a | grep 5b-First | wc -l) -ge 15 ]
   do
      sleep 1m
   done
   sleep 2s
   run $line
done
