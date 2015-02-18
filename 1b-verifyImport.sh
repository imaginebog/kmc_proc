#!/bin/bash

if [ $# -lt 1 ]
then
echo Usage: $0 subject
exit 100
fi

subject=$1

# verificar que estamos en el directorio correcto
cd /media/DATAPART5/kmc400/scripts

rootDir=../nii/$subject/
cd $rootDir
errors=0

#verificar Anatomica
if [ ! -f MPRAGEmodifiedSENSE.nii.gz ]
then
echo !MPRAGE not found
(( errors += 1 ))
else


dims=($(fslsize MPRAGEmodifiedSENSE.nii.gz | head -n 4 | tr -s ' ' | cut -d' ' -f2))

if [ ! "${dims[0]}" -eq 256 ] || [ ! "${dims[1]}" -eq 256 ] || [ ! "${dims[2]}" -eq 160 ] || [ ! "${dims[3]}" -eq 1 ]
then
echo !Wrong MPRAGE dimensions
echo ${dims[*]}
(( errors += 1 ))
else
echo MPRAGE fine
fi
fi

#verificar DTI
ref=31
if [ ! -f xDTIhighisoSENSE.nii.gz ]
then
echo !DTI not found
(( errors += 1 ))
else

dims=($(fslsize xDTIhighisoSENSE.nii.gz | head -n 4 | tr -s ' ' | cut -d' ' -f2))

if [ ! "${dims[0]}" -eq 128 ] || [ ! "${dims[1]}" -eq 128 ] || [ ! "${dims[2]}" -eq 70 ] || [ ! "${dims[3]}" -eq 33 ]
then
echo !Wrong DTI dimensions
echo ${dims[*]}
(( errors += 1 ))
else
echo DTI Dimensions fine
fi

diff xDTIhighisoSENSE.bval ../$ref/xDTIhighisoSENSE.bval > /dev/null
if [ ! $? -eq 0 ]
then
echo !Different bval
(( errors += 1 ))
else
echo DTI bval Fine
fi

diff xDTIhighisoSENSE.bvec ../$ref/xDTIhighisoSENSE.bvec > /dev/null
if [ ! $? -eq 0 ]
then
echo !Different bvec
(( errors += 1 ))
else
echo DTI bvec fine
fi
fi

#verificar Funcionales =============================================

#Prension

if [ ! -f PRENSIONSENSE.nii.gz ]
then
echo !Prension nor found
(( errors += 1 ))
else

dims=($(fslsize PRENSIONSENSE.nii.gz | head -n 4 | tr -s ' ' | cut -d' ' -f2))

if [ ! "${dims[0]}" -eq 80 ] || [ ! "${dims[1]}" -eq 80 ] || [ ! "${dims[2]}" -eq 40 ] || [ ! "${dims[3]}" -eq 125 ]
then
echo !Wrong Prension dimensions
echo ${dims[*]}
(( errors += 1 ))
else 
echo Prension Fine
fi
fi

#Coordinacion
if [ ! -f COORDINACIONSENSE.nii.gz  ]
then
echo !Coordinacion not found
(( errors += 1 ))
else

dims=($(fslsize COORDINACIONSENSE.nii.gz  | head -n 4 | tr -s ' ' | cut -d' ' -f2))

if [ ! "${dims[0]}" -eq 80 ] || [ ! "${dims[1]}" -eq 80 ] || [ ! "${dims[2]}" -eq 40 ] || [ ! "${dims[3]}" -eq 90 ]
then
echo !Wrong coordinacion dimensions
echo ${dims[*]}
(( errors += 1 ))
else 
echo coordinacion fine
fi
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
echo !Wrong Miedo dimensions
echo ${dims[*]}
(( errors += 1 ))
else
echo Miedo Fine
fi
fi



if [ ! -f ATENCIONSENSE.nii.gz  ]
then
if [ $MIEDO -eq 0 ]
then
echo !Atencion not found
(( errors += 1 ))
fi
else

dims=($(fslsize ATENCIONSENSE.nii.gz  | head -n 4 | tr -s ' ' | cut -d' ' -f2))

if [ ! "${dims[0]}" -eq 80 ] || [ ! "${dims[1]}" -eq 80 ] || [ ! "${dims[2]}" -eq 40 ] || [ ! "${dims[3]}" -eq 90 ]
then
echo Wrong Atencion dimensions
echo ${dims[*]}
(( errors += 1 ))
else
echo Atencion Fine
fi
fi

if [ ! -f MEMORIASENSE.nii.gz  ]
then
if [ $MIEDO -eq 0 ]
then
echo !MEMORIA not found
(( errors += 1 ))
fi
else

dims=($(fslsize MEMORIASENSE.nii.gz  | head -n 4 | tr -s ' ' | cut -d' ' -f2))

if [ ! "${dims[0]}" -eq 80 ] || [ ! "${dims[1]}" -eq 80 ] || [ ! "${dims[2]}" -eq 40 ] || [ ! "${dims[3]}" -eq 128 ]
then
echo !Wrong MEMORIA dimensions
echo ${dims[*]}
(( errors += 1 ))
else
echo Memoria Fine
fi



fi


#volver a scripts
cd /media/DATAPART5/kmc400/scripts
if [ $errors -eq 0 ]
then
echo All tests passed
exit 0
else
echo $errors errors found
exit $errors
fi
