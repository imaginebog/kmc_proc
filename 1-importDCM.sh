#! /bin/bash

if [ $# -lt 2 ]
then
echo Usage: $0 subject indir
exit 0
fi



subject=$1
indir=$2

# verificar que estamos en el directorio correcto
cd /media/DATAPART5/kmc400/scripts
prog=/media/DATAPART5/applications/mricron/dcm2nii
mkdir ../nii/$subject
$prog -o ../nii/$subject -b dcm2nii_kmc.ini $indir
