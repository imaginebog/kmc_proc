#! /bin/bash

if [ $# -lt 1 ]
then
echo Usage: $0 subject
exit 0
fi

subject=$1
log_file=$(pwd)/logs/SPM_pre_$1.txt

#logging
echo running $0 $1 $2 > $log_file
echo started $1 : $(date) >> $log_file
echo ============ >> $log_file

paradigmas=(ATENCIONSENSE COORDINACIONSENSE MEMORIASENSE MIEDOSofToneSENSE PRENSIONSENSE)
matlab=/usr/local/MATLAB/R2012a/bin/matlab
cd /media/DATAPART5/kmc400/scripts/spm

# crear directorio para el sujeto

if [ ! -d /media/DATAPART5/kmc400/spm/$subject ]; then
    echo "Preproc: Directory not created, creating..."
    mkdir /media/DATAPART5/kmc400/spm/$subject
    echo "Done"
fi
# copiar la anatomica
if [ ! -d /media/DATAPART5/kmc400/spm/$subject/T1 ]; then
    echo "Preproc: T1 Directory not created, creating..."
    mkdir /media/DATAPART5/kmc400/spm/$subject/T1
    echo "Done"
fi
cp /media/DATAPART5/kmc400/nii/$subject/MPRAGEmodifiedSENSE.nii.gz /media/DATAPART5/kmc400/spm/$subject/T1/T1.nii.gz
gzip -df /media/DATAPART5/kmc400/spm/$subject/T1/T1.nii.gz

#Procesar la anatomica 
# AHORA SE REALIZA DENTRO DE CADA PARADIGMA
#echo processing anatomic
#$matlab -r "procT1func('$subject');exit"


#============RECORRER PARADIGMAS================
for pdgm in ${paradigmas[*]}
do
    if [ -f /media/DATAPART5/kmc400/nii/$subject/$pdgm.nii.gz ] #Verificar si se tomo la secuencia (hay dos grupos con paradigmas diferentes)
    then

        echo "processing $pdgm for subject $subject" >> $log_file 2>&1 
        # crear directorios para cada paradigma
        mkdir /media/DATAPART5/kmc400/spm/$subject/$pdgm

        # separar las imagenes nii y llenar los directorios
        fslsplit /media/DATAPART5/kmc400/nii/$subject/$pdgm /media/DATAPART5/kmc400/spm/$subject/$pdgm/BOLD- >> $log_file 2>&1 
        gzip -df /media/DATAPART5/kmc400/spm/$subject/$pdgm/BOLD-*.nii.gz 

        # copiar la anatomica al directorio
        cp /media/DATAPART5/kmc400/spm/$subject/T1/T1.nii /media/DATAPART5/kmc400/spm/$subject/$pdgm/

        #preprocesar imagenes del paradigma
        # timeut in 30min
        doalarm 1800 $matlab -r "preProcFunc('$subject','$pdgm')" >> $log_file 2>&1 
        exit_code=$?
        if [ $exit_code -eq 0 ]
        then
            echo
            echo "Preprocessing of $pdgm for subject $subject completed succesfully" >> $log_file 2>&1
        elif [ $exit_code -eq 1 ]
        then
            echo WARNING: Too much movement >> $log_file 2>&1 
            echo WARNING: Too much movement >&2
        else
            echo Error running SPM... please check output >> $log_file 2>&1 
            echo Error running SPM... please check output >&2
        fi

    fi

done

echo Finished looping through paradigms >> $log_file 2>&1 
#===============================================
# retornar a scripts
cd -
echo finished $1 : $(date) >> $log_file



