#!/bin/bash


function run {
echo started $1 : $(date)
echo ./2a-freeSurfer_seg_fornix.sh $1
./2a-freeSurfer_seg_fornix.sh $1 &

}

exec < total_freesurfer.txt
while read line
do
   while [ $(ps | grep 2a-freeSurfer_seg_fornix.sh | wc -l) -ge 14 ]
   do
      sleep 1m
   done
   sleep 2s
   run $line
done
