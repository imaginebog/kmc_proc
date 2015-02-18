#!/bin/bash


function run {
echo started $1 : $(date)
echo ./5a-First_Level_Miedo.sh $1
./5a-First_Level_Miedo.sh $1 &

}

exec < faltantes_miedo.txt
while read subject
do
   if [ -f /media/DATAPART5/kmc400/nii/$subject/MIEDOSofToneSENSE.nii.gz ]
   then
       while [ $(ps -a | grep 5a-First | wc -l) -ge 7 ]
       do
           sleep 1m
       done
       sleep 2s
       run $subject
   fi
done
