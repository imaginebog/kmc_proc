#!/bin/bash

paradigmas=(ATENCIONSENSE COORDINACIONSENSE MEMORIASENSE MIEDOSofToneSENSE PRENSIONSENSE)

function run {
echo started $1 : $(date)
echo ./copy_fl_swra_2_pablo.sh $1 $2
./copy_fl_swra_2_pablo.sh $1 $2 &

}

exec < faltantes.txt
while read subject
do
   for pdgm in ${paradigmas[*]}
   do
      if [ -f /media/DATAPART5/kmc400/nii/$subject/$pdgm.nii.gz ]
      then 
         while [ $(ps -a | grep copy_fl | wc -l) -ge 10 ]
         do
            sleep 10s
         done
         sleep 2s
         run $subject $pdgm
      fi
   done
done
