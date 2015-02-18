#!/bin/bash

#log_file=logs/SPM_new_all.txt

function run {
./copy_rps.sh $1 $2 &
}

function all_spm {
 
exec < finish_spm.txt
while read line
do
   while [ $(ps -a | grep copy_rps | wc -l) -ge 5 ]
   do
      sleep 1m
   done
   sleep 2s
   IFS=' ' read subject pdgm <<< $line
   echo $subject
   echo $pdgm
   run $subject $pdgm
done
}

all_spm

#exec 3>&1 1>>$log_file 2>&1
#all_spm | tee /dev/fd/3
