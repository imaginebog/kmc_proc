#!/bin/bash

if [ $# -lt 2 ]
then
echo Usage: $0 subject indir
exit 0
fi


# Code of the subject (first parameter of the script)
SUBJ=$1

work_dir=/media/DATAPART5/kmc400/nii/$SUBJ
echo $work_dir

# Create output directory if it doesn't exists
echo "[$SUBJ-1/30] Checking if output directory exists..."
if [ ! -d $work_dir ]; then
   mkdir -p $work_dir
   echo "[$SUBJ-1/30] Output Directory created!"
else 
   echo "[$SUBJ-1/30] Output Directory already created, deleting old files!"
#   rm -rf $work_dir/*
fi;
