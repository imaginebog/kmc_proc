#!/bin/bash

exec < faltantes_dti_mov.txt
while read subj
do
   echo $subj
   if [ -f /media/DATAPART5/kmc400/dti_movement/$subj/rp_vol0001.txt ]; then
       mkdir -p /home/pablo/dti_mov/$subj
       cp /media/DATAPART5/kmc400/dti_movement/$subj/rp_vol0001.txt /home/pablo/dti_mov/$subj
   else
       exit
   fi

   if [ -f /media/DATAPART5/kmc400/dti_movement/$subj/WARNING.txt ]; then
       cp /media/DATAPART5/kmc400/dti_movement/$subj/WARNING.txt /home/pablo/dti_mov/$subj
   fi

done
