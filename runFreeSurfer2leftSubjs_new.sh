#!/bin/bash


function run {
echo started $1 : $(date)
echo ./2-freeSurfer.sh $1
./2-freeSurfer.sh $1 &

}

cd /media/DATAPART5/kmc400/scripts
exec < left2runFS.txt
while read line
do
   while [ $(ps | grep 2-freeSurfer.sh | wc -l) -ge 12 ]
   do
      sleep 1m
   done
   sleep 2s
   run $line
done
