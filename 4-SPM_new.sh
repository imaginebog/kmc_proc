#! /bin/bash

if [ $# -lt 2 ]
then
echo Usage: $0 subject paradigm
exit 0
fi

subject=$1
pdgm=$2
sep="_"
log_file_sub=$(pwd)/logs/SPM_new_$1$sep$2.txt

#logging
matlab=/usr/local/MATLAB/R2012a/bin/matlab
cd /media/DATAPART5/kmc400/scripts/spm

# crear directorio para el sujeto

function spm_run {
echo ============
echo running $0 $1 $2
echo started $1 $2: $(date)
echo log_file_sub $log_file_sub

if [ -d /media/DATAPART5/kmc400/spm/$subject ] 
then
    echo "Subject Directory already created"
else
    echo "Creating Subject Directory"
    mkdir /media/DATAPART5/kmc400/spm/$subject
fi

# copiar la anatomica
if [ -d /media/DATAPART5/kmc400/spm/$subject/T1 ]
then 
    echo "T1 directory already created"
else
    echo "Creating T1 directory"
    mkdir /media/DATAPART5/kmc400/spm/$subject/T1
fi

if [ -f /media/DATAPART5/kmc400/nii/$subject/MPRAGEmodifiedSENSE.nii.gz ]
then
    if [ -f /media/DATAPART5/kmc400/spm/$subject/T1/T1.nii.gz ]
    then
       echo "T1 Already copied"
    else
       echo "Copying MPRAGE to SPM"
       cp /media/DATAPART5/kmc400/nii/$subject/MPRAGEmodifiedSENSE.nii.gz /media/DATAPART5/kmc400/spm/$subject/T1/T1.nii.gz
        gzip -df /media/DATAPART5/kmc400/spm/$subject/T1/T1.nii.gz
    fi
else
    echo "ERROR: NO MPRAGE in subject $subject"
fi

if [ -f /media/DATAPART5/kmc400/nii/$subject/$pdgm.nii.gz ] 
then 

else

fi

}


exec 3>&1 1>>$log_file_sub 2>&1

spm_run | tee /dev/fd/3

#
#
##============RECORRER PARADIGMAS================
#for pdgm in ${paradigmas[*]}
#do
#if [ -f /media/backups/kmc400/nii/$subject/$pdgm.nii.gz ] #Verificar si se tomo la secuencia (hay dos grupos con paradigmas diferentes)
#then
#
#echo "processing $pdgm for subject $subject" >> $log_file 2>&1 
## crear directorios para cada paradigma
#mkdir /media/backups/kmc400/spm/$subject/$pdgm
#
## separar las imagenes nii y llenar los directorios
#fslsplit /media/backups/kmc400/nii/$subject/$pdgm /media/backups/kmc400/spm/$subject/$pdgm/BOLD- >> $log_file 2>&1 
#gzip -df /media/backups/kmc400/spm/$subject/$pdgm/BOLD-*.nii.gz 
#
## copiar la anatomica al directorio
#cp /media/backups/kmc400/spm/$subject/T1/T1.nii /media/backups/kmc400/spm/$subject/$pdgm/
#
##preprocesar imagenes del paradigma
## timeut in 30min
#doalarm 1800 $matlab -r "preProcFunc('$subject','$pdgm')" >> $log_file 2>&1 
#exit_code=$?
#if [ $exit_code -eq 0 ]
#then
#echo
#echo "Preprocessing of $pdgm for subject $subject completed succesfully" >> $log_file 2>&1
#elif [ $exit_code -eq 1 ]
#then
#echo WARNING: Too much movement >> $log_file 2>&1 
#echo WARNING: Too much movement >&2
#else
#echo Error running SPM... please check output >> $log_file 2>&1 
#echo Error running SPM... please check output >&2
#fi
#
#fi
#
#done
#
#echo Finished looping through paradigms >> $log_file 2>&1 
##===============================================
## retornar a scripts
#cd -
#echo finished $1 : $(date) >> $log_file
