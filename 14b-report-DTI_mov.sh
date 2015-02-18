#! /bin/bash
possible_files=faltantes_dti_mov.txt
sep=","

echo -n "Subject,"
echo -n "DTI_mov_2mm,"
echo -n "DTI_mov_3mm"
echo ""

exec < $possible_files
while read subj
do
   # Subject
   echo -n $subj$sep

   # DTI WARNING.txt in 2mm
   if [ -f /media/DATAPART5/kmc400/dti_movement/$subj/WARNING_2mm.txt ]
   then
      echo -n "1,"
   else
      echo -n "0,"
   fi

   # DTI WARNING.txt in 3mm
   if [ -f /media/DATAPART5/kmc400/dti_movement/$subj/WARNING_3mm.txt ]
   then
      echo -n "1"
   else
      echo -n "0"
   fi
   echo ""
done


