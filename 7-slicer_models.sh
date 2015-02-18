#! /bin/bash

if [ $# -lt 1 ]
then
echo Usage: $0 subject
exit 0
fi

subject=$1
log_file=logs/slicer_$1.txt

kmc_400_root=/media/DATAPART5/kmc400
apps_root=/media/DATAPART5/applications

#logging
echo running $0 $1 $2 > $log_file
echo started $1 : $(date) >> $log_file
echo ============ >> $log_file

# verificar que estamos en el directorio correcto
cd $kmc_400_root/scripts 

out_dir=$kmc_400_root/slicer_models/$1
#aparc and cortex 

infile=$kmc_400_root/freeSurfer_Tracula/$1/mri/aparc+aseg.mgz
bash generate_slicer_models.sh $infile $out_dir >> $log_file 2>&1

#wm
cd $kmc_400_root/scripts 
infile=$kmc_400_root/freeSurfer_Tracula/$1/mri/wmparc.mgz

if [ -d $out_dir ]; then

bash generate_slicer_models.sh $infile $out_dir  >> $log_file 2>&1

echo Slicer completed succesfully >> $log_file 2>&1

fi
#white matter
