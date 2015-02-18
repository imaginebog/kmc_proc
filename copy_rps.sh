#! /bin/bash

if [ $# -lt 2 ]
then
echo Usage: $0 subject paradigm
exit 0
fi



subject=$1
paradigm=$2

spm_dir=/media/DATAPART5/kmc400/spm/$subject/$paradigm
out_dir=/media/DATAPART5/kmc400/rp_files/$subject/$paradigm

if [ ! -d $out_dir ]
then
    echo "Directory Not created.. creating..."
    mkdir -p $out_dir
else
    echo "Directory already created"
fi

#If there is the movement file (rp_aBOLD-0000.txt)
if [ -f $spm_dir/rp_aBOLD-0000.txt ]
then
    echo "rp file present. Copying it..."
    cp $spm_dir/rp_aBOLD-0000.txt $out_dir/
    echo "Done!"
else
    echo "ERROR! rp file not present"
fi
