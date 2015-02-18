#!/bin/bash

#log_file=logs/SPM_new_all.txt

function run {
./5a-First_Level_Miedo.sh $1 &
}

function all_spm {
 
exec < finish_spm_miedo_2.txt
while read line
do
   while [ $(ps -a | grep 5a-First_Level_ | wc -l) -ge 7 ]
   do
      sleep 1m
   done
   sleep 2s
   echo $line
   run $line
done
}

all_spm

#exec 3>&1 1>>$log_file 2>&1
#all_spm | tee /dev/fd/3
