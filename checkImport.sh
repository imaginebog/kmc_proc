#!/bin/bash

cd /media/DATAPART5/kmc400/scripts
date >> 1b-tests.txt
rm approved.txt
exec < nii.txt
while read line
do
echo $line >> 1b-tests.txt
./1b-verifyImport.sh $line >> 1b-tests.txt
if [ $? -eq 0 ]
then
echo $line >> approved.txt
fi
cd /media/DATAPART5/kmc400/scripts 
echo =========== >> 1b-tests.txt
done
