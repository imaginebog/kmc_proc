#! /bin/bash

if [ $# -lt 1 ]
then
echo Usage: $0 subject
exit 0
fi

subject=$1
paradigmas=(ATENCIONSENSE COORDINACIONSENSE MEMORIASENSE MIEDOSofToneSENSE PRENSIONSENSE)


# crear directorio para el sujeto

mkdir /media/DATAPART5/kmc400/ftp/preproc/$subject


#============RECORRER PARADIGMAS================
for pdgm in ${paradigmas[*]}
do
if [ -f /media/DATAPART5/kmc400/nii/$subject/$pdgm.nii.gz ] #Verificar si se tomo la secuencia (hay dos grupos con paradigmas diferentes)
then

echo "copying results from $pdgm for subject $subject"
# crear directorios para cada paradigma
mkdir /media/DATAPART5/kmc400/ftp/preproc/$subject/$pdgm

# copiar anatomica corregistrada
cp /media/DATAPART5/kmc400/spm/$subject/$pdgm/T1.nii /media/DATAPART5/kmc400/ftp/preproc/$subject/$pdgm/

# copiar segmentacion anatomica
cp /media/DATAPART5/kmc400/spm/$subject/$pdgm/c[12]T1.nii /media/DATAPART5/kmc400/ftp/preproc/$subject/$pdgm/

# copiar Bold 'smooth'
cp /media/DATAPART5/kmc400/spm/$subject/$pdgm/swraBOLD-* /media/DATAPART5/kmc400/ftp/preproc/$subject/$pdgm/

# archivo de parametros de movimiento
cp /media/DATAPART5/kmc400/spm/$subject/$pdgm/rp_aBOLD-0000.txt /media/DATAPART5/kmc400/ftp/preproc/$subject/$pdgm/

# spm.matrp_aBOLD-0000.txt
# cp /media/DATAPART5/kmc400/spm/$subject/$pdgm/canonical /media/DATAPART5/kmc400/ftp/preproc/$subject/$pdgm/

fi
done

echo Finished looping through paradigms
#Warnings
 [ -f /media/DATAPART5/kmc400/spm/$subject/*WARNING.txt ] && cp /media/DATAPART5/kmc400/spm/$subject/*WARNING.txt /media/DATAPART5/kmc400/ftp/preproc/$subject

#===============================================

