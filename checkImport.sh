#!/bin/bash

cd /media/DATAPART5/kmc400/scripts
date >> 1b-tests2.txt
rm approved2.txt
exec < nii3.txt
while read line
do
echo $line >> 1b-tests2.txt
./1b-verifyImport.sh $line >> 1b-tests2.txt 2>&1
if [ $? -eq 0 ]
then
echo $line >> approved2.txt
fi
cd /media/DATAPART5/kmc400/scripts 
echo =========== >> 1b-tests2.txt
done
