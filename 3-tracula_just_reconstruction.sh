#! /bin/bash

if [ $# -lt 1 ]
then
echo Usage: $0 subject
exit 0
fi

kmc_400_root=/media/DATAPART5/kmc400
apps_root=/media/DATAPART5/applications

bash 10-Transpose_bval_files.sh $1
bash 10-Transpose_bvec_files.sh $1

subject=$1
log_file=$kmc_400_root/scripts/logs/tracula_path_reconst_$1.txt

#logging
echo running $0 $1 $2 > $log_file
echo started $1 : $(date) >> $log_file
echo ============ >> $log_file

#Variables de entorno de freesurfer
export FREESURFER_HOME=$apps_root/free_surfer_new/freesurfer
export SUBJECTS_DIR=$kmc_400_root/freeSurfer_Tracula

cd tracula
#crear archivo de configuracion para el sujeto
echo "set subjlist = ($subject)" > high_temp_${subject}.conf
echo "set bvecfile = $kmc_400_root/freeSurfer_Tracula/$subject/bvec/bvec.txt" >> high_temp_${subject}.conf
echo "set bvalfile = $kmc_400_root/freeSurfer_Tracula/$subject/bval/bval.txt" >> high_temp_${subject}.conf

cat high.conf >> high_temp_${subject}.conf

##======preproc======
#trac-all -prep -c high_temp_${subject}.conf >> $log_file 2>&1
#if [ $? -eq 0 ]
#then
#echo Preproc completed succesfully >> $log_file 2>&1
#else
#echo Error running Preproc... please check output >> $log_file 2>&1
#echo Error running Preproc... please check output >&2
#exit 1
#fi
#
##====bedpostx====
#
##mkdir $SUBJECTS_DIR/$subject/dmri/nodif_brain_mask.nii.gz 
## vincular mascara anatomica
## Esto ahora lo hace preproc, como deberia ser
##ln -sf $SUBJECTS_DIR/$subject/dlabel/diff/anat_brain_mask.flt.nii.gz \
##$SUBJECTS_DIR/$subject/dmri/nodif_brain_mask.nii.gz
#
## vincular datos 
## esto ahora lo hace preproc, como deberia ser
##ln -sf $SUBJECTS_DIR/$subject/dmri/dwi.nii.gz $SUBJECTS_DIR/$subject/dmri/data.nii.gz
#
## correr bedpost x
#echo >> $log_file 2>&1
#
#if [ ! -f $kmc_400_root/freeSurfer_Tracula/$subject/dmri.bedpostX/merged_th1samples.nii.gz ]
#then
#echo "Starting bedpostX .... this will take a while" >> $log_file 2>&1
#bedpostx $SUBJECTS_DIR/$subject/dmri >> $log_file 2>&1
#fi
#
## trac-all -bedp -c high_temp.conf
#if [ $? -eq 0 ]
#then
#echo Bedpostx completed succesfully >> $log_file 2>&1
#else 
#echo Error running Bedpostx... please check output >> $log_file 2>&1
#echo Error running Bedpostx... please check output >&2
#exit 1
#fi



#=====reconstruction=======
trac-all -path -c high_temp_${subject}.conf >> $log_file 2>&1
if [ $? -eq 0 ]
then
echo Path reconstruction completed succesfully >> $log_file 2>&1
else
echo Error in Path reconstruction... please check output >> $log_file 2>&1
echo Error in Path reconstruction... please check output >&2
exit 1
fi

#volver a scripts
cd ..
