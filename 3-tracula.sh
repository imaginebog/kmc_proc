#! /bin/bash

if [ $# -lt 1 ]
then
echo Usage: $0 subject
exit 0
fi

subject=$1

#Variables de entorno de freesurfer
export FREESURFER_HOME=/media/DATAPART4/DarMart/Software/Fuentes/freesurfer
export SUBJECTS_DIR=/media/DATAPART5/kmc400/freeSurfer_Tracula

cd tracula
#crear archivo de configuracion para el sujeto
echo "set subjlist = ($subject)" > high_temp.conf
cat high.conf >> high_temp.conf

#======preproc======
trac-all -prep -c high_temp.conf
if [ $? -eq 0 ]
then
echo Preproc completed succesfully
else
echo Error running Preproc... please check output
echo Error running Preproc... please check output >&2
exit 1
fi

#====bedpostx====

# vincular mascara anatomica
ln -sf $SUBJECTS_DIR/$subject/dlabel/diff/anat_brain_mask.flt.nii.gz \
$SUBJECTS_DIR/$subject/dmri/nodif_brain_mask.nii.gz

# vincular datos
ln -sf $SUBJECTS_DIR/$subject/dmri/dwi.nii.gz $SUBJECTS_DIR/$subject/dmri/data.nii.gz

# correr bedpost x
echo
echo "Starting bedpostX .... this will take a while"
bedpostx $SUBJECTS_DIR/$subject/dmri

# trac-all -bedp -c high_temp.conf
if [ $? -eq 0 ]
then
echo Bedpostx completed succesfully
else
echo Error running Bedpostx... please check output
echo Error running Bedpostx... please check output >&2
exit 1
fi



#=====reconstruction=======
trac-all -path -c high_temp.conf
if [ $? -eq 0 ]
then
echo Path reconstruction completed succesfully
else
echo Error in Path reconstruction... please check output
echo Error in Path reconstruction... please check output >&2
exit 1
fi

#volver a scripts
cd ..