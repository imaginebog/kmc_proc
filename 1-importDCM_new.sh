#! /bin/bash

if [ $# -lt 2 ]
then
echo Usage: $0 subject in_dir
exit 0
fi



subject=$1
in_dir=$2
out_dir=/media/DATAPART5/kmc400/nii/$subject
log_file=logs/dcm2nii_$1.txt

# verificar que estamos en el directorio correcto
cd /media/DATAPART5/kmc400/scripts
prog=/media/DATAPART5/applications/mricron/dcm2nii

#logging
echo running $0 $1 $2 > $log_file
echo started $1 : $(date) >> $log_file
echo ============ >> $log_file


echo "Checking if output directory $out_dir exists..."
if [ ! -d $out_dir ]; then
   echo "Creating directory $out_dir ..."
   mkdir -p $out_dir
   echo "Directory $out_dir created!"
else
   echo "Output Directory $out_dir already created"
   #rm -rf $out_dir
   #exit
fi
   
echo "Converting Dicom to nii..."
$prog -o $out_dir -b dcm2nii_kmc.ini $in_dir >> $log_file 2>&1 
echo "Done!"

if [ $? -eq 0 ]
then
echo ======dcm2nii completed succesfully=====
echo >> $log_file
echo ======dcm2nii completed succesfully===== >> $log_file 

fi
cat $log_file
