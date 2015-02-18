#! /bin/bash

if [ $# -lt 2 ]
then
echo Usage: $0 subject paradigm
exit 0
fi



subject=$1
paradigm=$2

spm_dir=/media/DATAPART5/kmc400/spm/$subject/$paradigm
out_dir=/media/DATAPART5/kmc400/spm/$subject/$paradigm

if [ ! -d $out_dir ]
then
    echo "Directory Not created.. creating..."
    mkdir -p $out_dir
else
    echo "Directory already created"
fi

#command to find swra* files
swra=$(find $spm_dir -type f -name "swra*")

#If there are any files, then copy them...
if [[ (-n $swra) ]]
then
    echo "Copying swra* files..."
    cp $spm_dir/swra* $out_dir/
    echo "Done!"
else
    echo "ERROR! There is no swra* files"
fi

#If there is FirstLevel directory and files inside it, copy it
if [ -d $spm_dir/FirstLevel ]
then
    firstLevel=$(find $spm_dir/FirstLevel -type f -name "*")
    if [[ (-n $firstLevel) ]]
    then
        echo "Files present in FistLevel directory. Copying them..."
        cp -r $spm_dir/FirstLevel $out_dir/
    else
        echo "ERROR! There are no files in FirstLevel directory."
    fi
else
    echo "ERROR! There is no FirstLevel directory."
fi

#If there is the movement file (rp_aBOLD-0000.txt)
#if [ -f $spm_dir/rp_aBOLD-0000.txt ]
#then
#    echo "rp file present. Copying it..."
#    cp $spm_dir/rp_aBOLD-0000.txt $out_dir/
#    echo "Done!"
#else
#    echo "ERROR! rp file not present"
#fi
