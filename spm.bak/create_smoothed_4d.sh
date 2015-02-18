#! /bin/bash

if [ $# -lt 1 ]
then
echo Usage: $0 dir
exit 0
fi

dir=$1

cd $dir
if [ ! -f smoothed.nii.gz ]; then
 fslmerge -tr smoothed.nii.gz sw*.nii 3
fi
cd -
