#! /bin/bash

if [ $# -lt 1 ]
then
echo Usage: $0 subject
exit 0
fi

subject=$1

spm_dir=/media/DATAPART5/kmc400/spm/$subject
old_str=".old2"

paradigms=(ATENCIONSENSE COORDINACIONSENSE MEMORIASENSE MIEDOSofToneSENSE PRENSIONSENSE)

if [ -d $spm_dir ]; then
    echo "Directory SPM already created for $subject ... moving to old..."
    mv $spm_dir $spm_dir$old_str
fi

./4-SPM_preproc.sh $subject

for pdgm in ${paradigms[*]}
do
    if [ -f /media/DATAPART5/kmc400/nii/$subject/$pdgm.nii.gz ]; then
        if [ $pdgm = "MIEDOSofToneSENSE" ]; then
            ./5a-First_Level_Miedo.sh $subject
        else
            ./5b-First_Level_Others.sh $subject $pdgm
        fi
    fi
done

