#! /bin/bash

if [ $# -lt 1 ]
then
echo Usage: $0 subject
exit 0
fi

subject=$1
paradigmas=(ATENCIONSENSE COORDINACIONSENSE MEMORIASENSE MIEDOSofToneSENSE PRENSIONSENSE)
matlab=/usr/local/MATLAB/R2010b-2/bin/matlab
cd spm

# crear directorio para el sujeto

mkdir /media/DATAPART5/kmc400/spm/$subject
# copiar la anatomica
mkdir /media/DATAPART5/kmc400/spm/$subject/T1
cp /media/DATAPART5/kmc400/nii/$subject/MPRAGEmodifiedSENSE.nii.gz /media/DATAPART5/kmc400/spm/$subject/T1/T1.nii.gz
gzip -df /media/DATAPART5/kmc400/spm/$subject/T1/T1.nii.gz

#Procesar la anatomica
echo $matlab -r "procT1func('$subject')"
$matlab -r "procT1func('$subject')"

#===============================================
# retornar a scripts
cd ..
