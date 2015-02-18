#!/bin/bash

function run {
echo started $1 : $(date)
date > logs/1b-verifyImport_$1.txt
echo =============== >> logs/1b-verifyImport_$1.txt
echo ./1b-verifyImportDeyberth.sh $1 >> logs/1b-verifyImport_$1.txt 2>&1 
./1b-verifyImportDeyberth.sh $1 >> logs/1b-verifyImport_$1.txt 2>&1 &
}

exec < newNii.txt
while read line
do
   while [ $(ps -a | grep 1b-verifyImportDeyberth.sh | wc -l) -ge 10 ]
   do
      sleep 10s
   done
   sleep 2s
   run $line
done
