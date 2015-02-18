#!/bin/bash

function main() {
readonly SUBJECTS_DIR=/media/DATAPART5/kmc400/freeSurfer_Tracula
readonly FADIR=/media/DATAPART5/kmc400/tbss
mkdir $FADIR 
while read line
do
local subject=$line
local fa_file=$SUBJECTS_DIR/$subject/dmri/dtifit_FA.nii.gz
if [ -f $fa_file ] 
then
cp $fa_file $FADIR/fa_$subject.nii.gz
fi
done
}

main