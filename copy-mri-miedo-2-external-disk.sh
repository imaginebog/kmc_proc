#!/bin/bash

copy_files ()
{
# Iterate over all subject in input file (copy_mri_miedo_2_disk.txt)
while read SUBJ; do
 echo "***** $SUBJ *****"
 # Check if T1 file exists
 echo "[$SUBJ-1] Checking if T1 file exists..."
 if [ ! -f $in_dir/$SUBJ/$T1_file ]; then
   echo "[$SUBJ-1] T1 File doesn't exists"
 fi;
 # Check if Attention file exists
 echo "[$SUBJ-2] Checking if Attention file exists..."
 if [ ! -f $in_dir/$SUBJ/$Attention_file ]; then
   echo "[$SUBJ-2] Attention File doesn't exists"
 fi;
 # Check if Fear file exists
 echo "[$SUBJ-3] Checking if Fear file exists..."
 if [ ! -f $in_dir/$SUBJ/$Fear_file ]; then
   echo "[$SUBJ-3] Fear File doesn't exists"
 fi;

 # Create output directory if it doesn't exists
 echo "[$SUBJ-4] Checking if output directory exists..."
 if [ ! -d $out_dir/$SUBJ ]; then
   mkdir -p $out_dir/$SUBJ
   echo "[$SUBJ-4] Output Directory created!"
 else
   echo "[$SUBJ-4] Output Directory already created, deleting old files!"
   rm -rf $out_dir/$SUBJ /*
 fi;
 cp $in_dir/$SUBJ/$T1_file $out_dir/$SUBJ/$T1_file 
 cp $in_dir/$SUBJ/$Attention_file $out_dir/$SUBJ/$Attention_file  
 cp $in_dir/$SUBJ/$Fear_file $out_dir/$SUBJ/$Fear_file
done < copy_mri_miedo_2_disk.txt
}

in_dir=/media/DATAPART5/kmc400/nii
out_dir=/media/ExternalDisk2/CanguroImages/1_mri
T1_file=MPRAGEmodifiedSENSE.nii.gz
Attention_file=ATENCIONSENSE.nii.gz
Fear_file=MIEDOSofToneSENSE.nii.gz

# Set up output to console and log file (at the same time)
exec 3>&1 1>>$out_dir/log.txt 2>&1
# Execute copy of files
copy_files | tee /dev/fd/3
