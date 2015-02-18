#! /bin/bash
possible_files=lista_pablo.txt
sep=","
found_nii_files=found_nii_files.txt

echo -n "Subject,"
echo -n "Dicom,"
echo -n "Nii,"
echo -n "FreeSurfer,"
echo -n "Tracula,"
echo -n "SPM,"
echo -n "Camino,"
echo -n "Slicer"
echo ""

exec < $possible_files
while read subj
do
   # Subject
   echo -n $subj$sep

   # Dicom
   if [ -d /media/DATAPART5/Dicom/$subj ]
   then
      echo -n "1"$sep
   else
      echo -n "0"$sep
   fi

   # Nii
   if [ -d /media/DATAPART5/kmc400/nii/$subj ]
   then
      echo -n "1"$sep
   else
      echo -n "0"$sep
   fi

   # FreeSurfer
   if [ -d /media/DATAPART5/kmc400/freeSurfer_Tracula/$subj ]
   then
      echo -n "1"$sep
   else
      echo -n "0"$sep
   fi

   # Tracula
   if [ -d /media/DATAPART5/kmc400/freeSurfer_Tracula/$subj ]
   then
      echo -n "1"$sep
   else
      echo -n "0"$sep
   fi

   # SPM
   if [ -d /media/DATAPART5/kmc400/spm/$subj ]
   then
      echo -n "1"$sep
   else
      echo -n "0"$sep
   fi

   # Camino
   if [ -d /media/DATAPART5/kmc400/tractography/$subj ]
   then
      echo -n "1"$sep
   else
      echo -n "0"$sep
   fi

   # Slicer
   if [ -d /media/DATAPART5/kmc400/slicer_models/$subj ]
   then
      echo -n "1"
   else
      echo -n "0"
   fi


   echo ""
done

#echo "Getting all possible files..."
#for subject in $(find * -maxdepth 0 -type d)
#do
#    cd $subject
#    for file in $(find * -maxdepth 0 -type f)
#    do
#       containsElement $file "${files_array[@]}"
#       result=$(echo $?)
#       if [[ $result == 0 ]]; then
#           files_array[${#files_array[*]}]=$file
#       fi
#    done
#    cd ..
#done
#
#echo "Sorting file listing..."
#readarray -t sorted_files < <(for a in "${files_array[@]}"; do echo "$a"; done | sort)
#
#echo "Writing Columns..."
#echo -n "Subject" > $found_nii_files
#for field in ${sorted_files[*]}
#do
#    echo -n $separator$field >> $found_nii_files
#done 
#echo "" >> $found_nii_files
#
#echo "Writing titles..."
#for subject in $(find * -maxdepth 0 -type d)
#do
#    echo $subject
#    cd $subject
#    echo -n "$subject," >> $found_nii_files
#    for file in ${sorted_files[*]}
#    do
#        if [ ! -f $file ]; then
#           echo -n "0"$separator >> $found_nii_files
#        else
#           echo -n "1"$separator >> $found_nii_files
#        fi
#    done
#    echo "" >> $found_nii_files
#    cd ..
#done
