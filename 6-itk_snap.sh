#! /bin/bash

if [ $# -lt 1 ]
then
echo Usage: $0 subject
exit 0
fi

subject=$1

# verificar que estamos en el directorio correcto
cd /media/DATAPART5/kmc400/scripts 

mkdir /media/DATAPART5/kmc400/itk_snap/$subject

#copy T1
mri_convert  /media/DATAPART5/kmc400/freeSurfer_Tracula/$subject/mri/T1.mgz /media/DATAPART5/kmc400/itk_snap/$subject/T1.nii.gz


#copy aseg
mri_convert  /media/DATAPART5/kmc400/freeSurfer_Tracula/$subject/mri/aseg.mgz /media/DATAPART5/kmc400/itk_snap/$subject/aseg.nii.gz
 

#link labels
ln -s /media/DATAPART5/kmc400/scripts/snap3b_out2.txt /media/DATAPART5/kmc400/itk_snap/$subject
