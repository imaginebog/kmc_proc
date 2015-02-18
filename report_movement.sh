#! /bin/bash
possible_files=lista_pablo_faltantes.txt
sep=","
found_nii_files=report_movement.txt

echo -n "Subject,"
echo -n "C.Prens,"
echo -n "C.Coor,"
echo -n "C.Mem,"
echo -n "C.Aten,"
echo -n "C.Miedo"
echo ""

exec < $possible_files
while read subj
do
   # Subject
   echo -n $subj$sep

   # PRENSIONSENSEWARNING.txt
   if [ -f /media/DATAPART5/kmc400/spm/$subj/PRENSIONSENSEWARNING.txt ]
   then
      echo -n "1"$sep
   else
      echo -n "0"$sep
   fi

   # COORDINACIONSENSEWARNING.txt
   if [ -f /media/DATAPART5/kmc400/spm/$subj/COORDINACIONSENSEWARNING.txt ]
   then
      echo -n "1"$sep
   else
      echo -n "0"$sep
   fi

   # MEMORIASENSEWARNING.txt
   if [ -f /media/DATAPART5/kmc400/spm/$subj/MEMORIASENSEWARNING.txt ]
   then
      echo -n "1"$sep
   else
      echo -n "0"$sep
   fi

   # ATENCIONSENSEWARNING.txt
   if [ -f /media/DATAPART5/kmc400/spm/$subj/ATENCIONSENSEWARNING.txt ]
   then
      echo -n "1"$sep
   else
      echo -n "0"$sep
   fi

   # MIEDOSofToneSENSEWARNING.txt
   if [ -f /media/DATAPART5/kmc400/spm/$subj/MIEDOSofToneSENSEWARNING.txt ]
   then
      echo -n "1"$sep
   else
      echo -n "0"$sep
   fi


   echo ""
done


