#! /bin/bash

if [ $# -lt 1 ]
then
echo Usage: $0 subject
exit 0
fi

subject=$1
log_file=logs/freeSurfer_broadmann_$1.txt

kmc_400_root=/media/DATAPART5/kmc400
apps_root=/media/DATAPART5/applications

#logging
echo running $0 $1 $2 > $log_file
echo started $1 : $(date) >> $log_file
echo ============ >> $log_file


# verificar que estamos en el directorio correcto
cd $kmc_400_root/scripts 

#Variables de entorno de freesurfer
export FREESURFER_HOME=$apps_root/free_surfer_new/freesurfer
export SUBJECTS_DIR=$kmc_400_root/freeSurfer_Tracula

#crear estructura de archivos de freesurfer
#mksubjdirs $SUBJECTS_DIR/$subject >> $log_file 2>&1
 
#Copiar imagen anatomica

#mri_convert ../nii/$subject/MPRAGEmodifiedSENSE.nii.gz ../freeSurfer_Tracula/$subject/mri/orig/001.mgz >> $log_file 2>&1

#freesurfer auto recon all
echo >> $log_file 2>&1
echo recon-all -s $subject -ba-labels >> $log_file 2>&1
echo ===================== >> $log_file 2>&1
recon-all -s $subject -ba-labels >> $log_file 2>&1

if [ $? -eq 0 ]
then
echo Free Surfer broadmann completed succesfully >> $log_file 2>&1
else
echo Error running broadmann free surfer... please check output >> $log_file 2>&1
echo Error running broadmann free surfer... please check output >&2
fi
