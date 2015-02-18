#! /bin/bash

if [ $# -lt 1 ]
then
echo Usage: $0 subject
exit 0
fi

subject=$1
log_file=$(pwd)/logs/DTI_mov_$1.txt

#logging
echo running $0 $1 > $log_file
echo started $1 : $(date) >> $log_file 2>&1
echo started $1 : $(date) >> $log_file >&2
echo ============ >> $log_file

matlab=/usr/local/MATLAB/R2012a/bin/matlab
#cd /media/DATAPART5/kmc400/scripts/spm

# Check if DTI file exists
if [ ! -f /media/DATAPART5/kmc400/nii/$subject/xDTIhighisoSENSE.nii.gz ]; then
    echo "DTI file not found... Exiting..."
    exit
else
    # crear directorio para el sujeto
   if [ ! -d /media/DATAPART5/kmc400/dti_movement/$subject ]; then
        echo "DTI movement: Directory not created, creating..."
        mkdir /media/DATAPART5/kmc400/dti_movement/$subject
        echo "Done"
    fi
    echo "Copying DTI file.."
    cp /media/DATAPART5/kmc400/nii/$subject/xDTIhighisoSENSE.nii.gz /media/DATAPART5/kmc400/dti_movement/$subject/
    echo "Done"
    echo "Splitting image..."
    cd /media/DATAPART5/kmc400/dti_movement/$subject/
    fslsplit xDTIhighisoSENSE.nii.gz
    echo "Done"
    echo "Deleting temp image..."
    cd /media/DATAPART5/kmc400/dti_movement/$subject/
    rm xDTIhighisoSENSE.nii.gz
    echo "Done"
    echo "Gunzipping images..."
    gunzip *.nii.gz
    echo "Done"
    echo "Executing matlab script..."
    cd /media/DATAPART5/kmc400/scripts/spm
    #timeout in 3 mins
    doalarm 180 $matlab -r "dti_movement('$subject')" >> $log_file 2>&1
    echo "Done"
    exit_code=$?
    if [ $exit_code -eq 0 ]
    then
        echo "DTI Movement detection for subject $subject completed succesfully" >> $log_file 2>&1
        echo "DTI Movement detection for subject $subject completed succesfully" >&2
    elif [ $exit_code -eq 1 ]
    then
        echo WARNING: Too much movement >> $log_file 2>&1 
        echo WARNING: Too much movement >&2
    else
        echo Error running DTI Movement... please check output >> $log_file 2>&1 
        echo Error running DTI Movement... please check output >&2
    fi
    #===============================================
    # retornar a scripts
    cd /media/DATAPART5/kmc400/scripts/
    echo finished $1 : $(date) >> $log_file
    

fi


