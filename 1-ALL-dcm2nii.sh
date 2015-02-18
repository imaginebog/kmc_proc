#!/bin/bash

function run {
echo started $1 : $(date)
date > logs/1-importDCM.sh_$1.txt
echo =============== >> logs/1-importDCM.sh_$1.txt
echo ./1-importDCM.sh $1 /media/DATAPART5/kmc400/nii/$1/dicom >> logs/1-importDCM.sh_$1.txt 2>&1 
./1-importDCM.sh $1 /media/DATAPART5/Dicom/$1/dicom >> logs/1-importDCM.sh_$1.txt 2>&1 &
}

exec < faltantes.txt
while read subject
do
   while [ $(ps -a | grep dcm2nii | wc -l) -ge 10 ]
   do
      sleep 10s
   done
   sleep 2s
   run $subject
done
