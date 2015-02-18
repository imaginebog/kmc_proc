#!/bin/bash

cd /media/DATAPART5/kmc400/dartel_template
#make sure directory is clean
rm *
#get random list of images
find ../nii -name MPRAGEmodifiedSENSE.nii.gz | shuf | head -n20 > ingredients.txt
#copy images here
index=0
while read l; do
cp ${l} ./mprage_${index}.nii.gz
index=$(( $index + 1 ))
done < ingredients.txt
#uncompress them
gunzip *.nii.gz

#now run the spm batch fie
#dartel_script_job