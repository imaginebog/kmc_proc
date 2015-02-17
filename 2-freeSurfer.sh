#! /bin/bash

if [ $# -lt 1 ]
then
echo Usage: $0 subject
exit 0
fi

subject=$1

# verificar que estamos en el directorio correcto
cd /media/DATAPART5/kmc400/scripts

#Variables de entorno de freesurfer
export FREESURFER_HOME=/media/DATAPART4/DarMart/Software/Fuentes/freesurfer
export SUBJECTS_DIR=/media/DATAPART5/kmc400/freeSurfer_Tracula

#crear estructura de archivos de freesurfer
mksubjdirs $SUBJECTS_DIR/$subject

#Copiar imagen anatomica

mri_convert ../nii/$subject/MPRAGEmodifiedSENSE.nii.gz ../freeSurfer_Tracula/$subject/mri/orig/001.mgz

#freesurfer auto recon all
recon-all -autorecon-all -subjid $subject

if [ $? -eq 0 ]
then
echo Free Surfer completed succesfully
else
echo Error running free surfer... please check output
echo Error running free surfer... please check output >&2
fi
