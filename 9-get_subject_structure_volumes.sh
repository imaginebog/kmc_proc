#!/bin/bash

structures_file=possible_structures.txt
subjects_file=faltantes_camino.txt
output_file=volumes_consolidated.txt
separator=";"

if [ -f $output_file ]
then
  rm $output_file
fi

echo -n "subject"$separator > $output_file 

while read structure; do
  echo -n $structure$separator >> $output_file
done < $structures_file

echo "" >> $output_file

while read subj; do
  if [ -f /media/DATAPART5/kmc400/freeSurfer_Tracula/$subj/stats/aseg.stats ] 
  then 
     echo $subj 
     echo -n $subj$separator >> $output_file
     while read structure; do
        gawk_cmd=`gawk -f gawk_vol_extractor.sh -v struct=$structure /media/DATAPART5/kmc400/freeSurfer_Tracula/$subj/stats/aseg.stats`
        echo -n $gawk_cmd$separator >> $output_file
     done < $structures_file
     echo "" >> $output_file
  fi
done < $subjects_file
