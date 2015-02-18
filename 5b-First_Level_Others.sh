#! /bin/bash

if [ $# -lt 2 ]
then
echo Usage: $0 subject paradigm
exit 0
fi


function run {
if [ -f /media/DATAPART5/kmc400/nii/$subject/$pdgm.nii.gz ] #Verificar si se tomo la secuencia (hay dos grupos con paradigmas diferentes)
then
#check if output dir exists, and in that case delete it
    if [ -d /media/DATAPART5/kmc400/spm/$subject/$pdgm/FirstLevel ]
    then
        echo "First level directory present. Deleting it..."
        rm -r /media/DATAPART5/kmc400/spm/$subject/$pdgm/FirstLevel
        echo "Done!"
    fi
    echo "running first level on $pdgm for subject $subject"
    #timeut in 15 minutes
    doalarm 900 $matlab -r "firstLevel_all('$subject','$pdgm')"

    if [ $? -eq 0 ]
    then
        echo
        echo "First Level Processing of $pdgm for subject $subject completed succesfully"
    else
        echo Error running SPM... please check output
        echo Error running SPM... please check output >&2
        result=1
    fi 
else
    echo Paradigm $pdgm not found for subject $subject
fi

}

subject=$1
pdgm=$2
matlab=/usr/local/MATLAB/R2012a/bin/matlab
log_file=$(pwd)/logs/SPM_$2_$1.txt
echo $log_file
cd /media/DATAPART5/kmc400/scripts/spm
echo running $0 $1 > $log_file
echo started $1 : $(date) >> $log_file
echo >> $log_file
result=0
run >> $log_file 2>&1
if [ ! $result -eq 0 ]
then
    echo Error running $0 $1 $2 please check output >&2
fi
#===============================================
# retornar a scripts
cd -

