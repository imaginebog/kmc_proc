#! /bin/bash

if [ $# -lt 1 ]
then
    echo Usage: $0 subject
    exit 0
fi


function run {
if [ -f /media/DATAPART5/kmc400/nii/$subject/$pdgm.nii.gz ] #Verificar si se tomo la secuencia (hay dos grupos con paradigmas diferentes)
then
    #check if output dir exists, and in that case delete it
    if [ -d /media/DATAPART5/kmc400/spm/$subject/$pdgm/FirstLevel ]
    then
        rm -r /media/DATAPART5/kmc400/spm/$subject/$pdgm/FirstLevel
    fi
    #copy csv file
    if [ ! -f /media/DATAPART5/kmc400/fromExtHD/cvs_miedo/$subject.csv ]
    then
        echo "Not csv file found"
        echo "Not csv file found" >&2
    else
        cp /media/DATAPART5/kmc400/fromExtHD/cvs_miedo/$subject.csv /media/DATAPART5/kmc400/spm/$subject/$pdgm/onsets.csv
        echo "running first level on $pdgm for subject $subject"
        #Timeout in 5minutes 
        doalarm 300 $matlab -r "firstLevel_miedo('$subject')"
        if [ $? -eq 0 ]
        then
            echo
            echo "First level of $pdgm for subject $subject completed succesfully"
        else
            echo Error running SPM... please check output
            echo Error running SPM... please check output >&2
            result=1
        fi 

    fi
fi
}

subject=$1
pdgm=MIEDOSofToneSENSE
matlab=/usr/local/MATLAB/R2012a/bin/matlab
log_file=$(pwd)/logs/SPM_miedo_$1.txt
echo $log_file
cd /media/DATAPART5/kmc400/scripts/spm
echo running $0 $1 > $log_file
echo started $1 : $(date) >> $log_file
echo >> $log_file
result=0
run >> $log_file 2>&1
if [ ! $result -eq 0 ]
then
    echo Error running $0 $1 ... please check output >&2
fi
#===============================================
# retornar a scripts
cd -

