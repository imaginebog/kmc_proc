#!/bin/bash

function all_spm {

path_csv=/media/DATAPART5/kmc400/fromExtHD/cvs_miedo

exec < finish_spm_miedo_2.txt
while read subject
do
   cp $path_csv/1005.csv $path_csv/$subject.csv
done
}

all_spm

#exec 3>&1 1>>$log_file 2>&1
#all_spm | tee /dev/fd/3
