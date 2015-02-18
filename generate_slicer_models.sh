#!/bin/bash

if [ $# -lt 2 ]
then
echo Usage: $0 "<infile> <outputdir>"
exit 0
fi

kmc_400_root=/media/DATAPART5/kmc400
apps_root=/media/DATAPART5/applications

SLICER=$apps_root/Slicer-4.2.2-1-linux-amd64/Slicer
COLORS=$apps_root/free_surfer_new/freesurfer/FreeSurferColorLUT.txt
#convert input
INPUT=$1
OUTDIR=$2
if [ ! -d $OUTDIR ]; then
mkdir $OUTDIR
fi

INITIAL_DIR=$(pwd)
cd $OUTDIR

# Convert input file
dir=$(dirname "$INPUT")
filename=$(basename "$INPUT" .mgz)
whole_filename=$dir/$filename
echo $filename


mri_convert  $whole_filename.mgz $filename.nii.gz
$SLICER --launcher-no-splash --launch ModelMaker --pad --pointnormals --jointsmooth --generateAll -n slicer --color $COLORS  $filename.nii.gz

#clean model names
models=($(ls *.vtk) )
for m1 in ${models[*]} 
do
if [[ ! $m1 =~ slicer_[0-9]+_ ]]; then  echo Match not found; fi
sub=${BASH_REMATCH[0]}
len=${#sub}
clean_name=${m1:$len}
mv $m1 $clean_name
done


cd $INITIAL_DIR
