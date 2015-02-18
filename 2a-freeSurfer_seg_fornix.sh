#! /bin/bash

if [ $# -lt 1 ]
then
echo Usage: $0 subject
exit 0
fi

subject=$1
log_file=logs/freeSurfer_fornix_$1.txt

#logging
echo running $0 $1 $2 > $log_file
echo started $1 : $(date) >> $log_file
echo ============ >> $log_file


# verificar que estamos en el directorio correcto
cd /media/DATAPART5/kmc400/scripts 

#Variables de entorno de freesurfer
export FREESURFER_HOME=/media/DATAPART5/applications/free_surfer_new/freesurfer
export SUBJECTS_DIR=/media/DATAPART5/kmc400/freeSurfer_Tracula

#Copiar imagen anatomica
mri_cc -aseg aseg.auto_noCCseg.mgz -o aseg_fornix.auto.mgz -f $subject >> $log_file 2>&1

#freesurfer auto recon all
echo >> $log_file 2>&1

if [ $? -eq 0 ]
then
echo Free Surfer completed succesfully >> $log_file 2>&1
else
echo Error running free surfer... please check output >> $log_file 2>&1
echo Error running free surfer... please check output >&2
fi
