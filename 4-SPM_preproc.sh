#! /bin/bash

if [ $# -lt 1 ]
then
echo Usage: $0 subject
exit 0
fi

subject=$1
paradigmas=(ATENCIONSENSE COORDINACIONSENSE MEMORIASENSE MIEDOSofToneSENSE PRENSIONSENSE)
matlab=/usr/local/MATLAB/R2010b-2/bin/matlab
cd /media/DATAPART5/kmc400/scripts/spm

# crear directorio para el sujeto

mkdir /media/DATAPART5/kmc400/spm/$subject
# copiar la anatomica
mkdir /media/DATAPART5/kmc400/spm/$subject/T1
cp /media/DATAPART5/kmc400/nii/$subject/MPRAGEmodifiedSENSE.nii.gz /media/DATAPART5/kmc400/spm/$subject/T1/T1.nii.gz
gzip -df /media/DATAPART5/kmc400/spm/$subject/T1/T1.nii.gz

#Procesar la anatomica 
# AHORA SE REALIZA DENTRO DE CADA PARADIGMA
#echo processing anatomic
#$matlab -r "procT1func('$subject');exit"


#============RECORRER PARADIGMAS================
for pdgm in ${paradigmas[*]}
do
if [ -f /media/DATAPART5/kmc400/nii/$subject/$pdgm.nii.gz ] #Verificar si se tomo la secuencia (hay dos grupos con paradigmas diferentes)
then

echo "processing $pdgm for subject $subject"
# crear directorios para cada paradigma
mkdir /media/DATAPART5/kmc400/spm/$subject/$pdgm

# separar las imagenes nii y llenar los directorios
fslsplit /media/DATAPART5/kmc400/nii/$subject/$pdgm /media/DATAPART5/kmc400/spm/$subject/$pdgm/BOLD-
gzip -df /media/DATAPART5/kmc400/spm/$subject/$pdgm/BOLD-*.nii.gz

# copiar la anatomica al directorio
cp /media/DATAPART5/kmc400/spm/$subject/T1/T1.nii /media/DATAPART5/kmc400/spm/$subject/$pdgm/

#preprocesar imagenes del paradigma
$matlab -r "preProcFunc('$subject','$pdgm')"

#Movido a 5a-First_Level_Miedo
#if [ "$pdgm" = "MIEDOSofToneSENSE" ]
#then
#$matlab -r "firstLevel('$subject')"
#fi

if [ $? -eq 0 ]
then
echo
echo "Preprocessing of $pdgm for subject $subject completed succesfully"
else
echo Error running SPM... please check output
echo Error running SPM... please check output >&2
fi

fi

done

echo Finished looping through paradigms
#===============================================
# retornar a scripts
cd -
