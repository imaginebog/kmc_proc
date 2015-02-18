#!/bin/bash

if [ $# -lt 1 ]
then
  echo Usage: $0 subject
  exit 0
fi
kmc_400_root=/media/DATAPART5/kmc400
apps_root=/media/DATAPART5/applications

subject=$1
path2nii=$kmc_400_root/nii/
fs_sep="/"
original_file=xDTIhighisoSENSE.bval
path2input_file=$path2nii$subject$fs_sep$original_file
path2freeSurfer=$kmc_400_root/freeSurfer_Tracula/
newDir=bval
output_file=bval.txt
path2output=$path2freeSurfer$subject$fs_sep$newDir
table_separator=" "

echo "*** $subject ***"

if [ ! -f $path2input_file ]
then
  echo "Original bval file not found!"
  exit 1
fi

if [ ! -d $path2output ]; then
   echo -n "Creating output path..."
   mkdir -p $path2output
   echo "Done!"
else
   echo -n "Output Directory already created, deleting old files..."
   rm -rf $path2output/*
   echo "Done!"
fi;


#gawk_cmd="gawk -F, 'END{print NR}' $path2input_file"
#num_rows=`eval $gawk_cmd`
#echo "$num_rows"

#gawk_cmd="gawk 'BEGIN {FS=\"$table_separator\"} END{print NF}' $path2input_file"
#num_cols=`eval $gawk_cmd`
#echo "$num_cols"

echo -n "Transponsing matrix..."
gawk_cmd=`gawk -f transpose.gawk -v outputFile=$path2output$fs_sep$output_file $path2input_file`
echo $gawk_cmd 
#> $path2output$fs_sep$output_file
echo "Done!"
