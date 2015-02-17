#!/bin/bash

if [ $# -lt 1 ]
then
echo Usage: $0 subject
exit 0
fi

subject=$1

# verificar que estamos en el directorio correcto
cd /media/DATAPART5/kmc400/scripts

rootDir=../nii/$subject/
cd $rootDir


#verificar Anatomica
if [ ! -f MPRAGEmodifiedSENSE.nii.gz ]
then
echo MPRAGE not found
exit 1
fi


dims=($(fslsize MPRAGEmodifiedSENSE.nii.gz | head -n 4 | tr -s ' ' | cut -d' ' -f2))

if [ ! "${dims[0]}" -eq 256 ] || [ ! "${dims[1]}" -eq 256 ] || [ ! "${dims[2]}" -eq 160 ] || [ ! "${dims[3]}" -eq 1 ]
then
echo Wrong MPRAGE dimensions
echo ${dims[*]}
exit 2
fi

#verificar DTI
ref=31
if [ ! -f xDTIhighisoSENSE.nii.gz ]
then
echo DTI not found
exit 3
fi

dims=($(fslsize xDTIhighisoSENSE.nii.gz | head -n 4 | tr -s ' ' | cut -d' ' -f2))

if [ ! "${dims[0]}" -eq 128 ] || [ ! "${dims[1]}" -eq 128 ] || [ ! "${dims[2]}" -eq 70 ] || [ ! "${dims[3]}" -eq 33 ]
then
echo Wrong DTI dimensions
echo ${dims[*]}
exit 4
fi

diff xDTIhighisoSENSE.bval ../$ref/xDTIhighisoSENSE.bval > /dev/null
if [ ! $? -eq 0 ]
then
echo Different bval
exit 5
fi

diff xDTIhighisoSENSE.bvec ../$ref/xDTIhighisoSENSE.bvec > /dev/null
if [ ! $? -eq 0 ]
then
echo Different bvec
exit 6
fi

#verificar Funcionales =============================================

#Prension

if [ ! -f PRENSIONSENSE.nii.gz ]
then
echo Prension nor found
exit 7
fi

dims=($(fslsize PRENSIONSENSE.nii.gz | head -n 4 | tr -s ' ' | cut -d' ' -f2))

if [ ! "${dims[0]}" -eq 80 ] || [ ! "${dims[1]}" -eq 80 ] || [ ! "${dims[2]}" -eq 40 ] || [ ! "${dims[3]}" -eq 125 ]
then
echo Wrong Prension dimensions
echo ${dims[*]}
exit 8
fi

#Coordinacion
ref=
if [ ! -f COORDINACIONSENSE.nii.gz  ]
then
echo Coordinacion not found
exit 9
fi

dims=($(fslsize COORDINACIONSENSE.nii.gz  | head -n 4 | tr -s ' ' | cut -d' ' -f2))

if [ ! "${dims[0]}" -eq 80 ] || [ ! "${dims[1]}" -eq 80 ] || [ ! "${dims[2]}" -eq 40 ] || [ ! "${dims[3]}" -eq 90 ]
then
echo Wrong coordinacion dimensions
echo ${dims[*]}
exit 10
fi


#Miedo
MIEDO=0


if [ -f  MIEDOSofToneSENSE.nii.gz  ]
then
MIEDO=1
fi



if [ $MIEDO -eq 1 ]
then
dims=($(fslsize  MIEDOSofToneSENSE.nii.gz  | head -n 4 | tr -s ' ' | cut -d' ' -f2))
if [ ! "${dims[0]}" -eq 80 ] || [ ! "${dims[1]}" -eq 80 ] || [ ! "${dims[2]}" -eq 32 ] || [ ! "${dims[3]}" -eq 495 ]
then
echo Wrong Miedo dimensions
echo ${dims[*]}
exit 11
fi
fi

if [ $MIEDO -eq 0 ]
then

if [ ! -f ATENCIONSENSE.nii.gz  ]
then
echo Atencion not found
exit 12
fi

dims=($(fslsize ATENCIONSENSE.nii.gz  | head -n 4 | tr -s ' ' | cut -d' ' -f2))

if [ ! "${dims[0]}" -eq 80 ] || [ ! "${dims[1]}" -eq 80 ] || [ ! "${dims[2]}" -eq 40 ] || [ ! "${dims[3]}" -eq 90 ]
then
echo Wrong Atencion dimensions
echo ${dims[*]}
exit 13
fi

if [ ! -f MEMORIASENSE.nii.gz  ]
then
echo MEMORIA not found
exit 14
fi

dims=($(fslsize MEMORIASENSE.nii.gz  | head -n 4 | tr -s ' ' | cut -d' ' -f2))

if [ ! "${dims[0]}" -eq 80 ] || [ ! "${dims[1]}" -eq 80 ] || [ ! "${dims[2]}" -eq 40 ] || [ ! "${dims[3]}" -eq 128 ]
then
echo Wrong MEMORIA dimensions
echo ${dims[*]}
exit 15
fi



fi


#volver a scripts
cd /media/DATAPART5/kmc400/scripts
echo All tests passed
exit 0