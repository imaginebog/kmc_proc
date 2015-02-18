#! /bin/bash

if [ $# -lt 1 ]
then
echo Usage: $0 subject
exit 0
fi

subject=$1
log_file=/media/DATAPART5/kmc400/scripts/logs/tracula_$1.txt

#logging
echo running $0 $1 $2 > $log_file
echo started $1 : $(date) >> $log_file
echo ============ >> $log_file

#Variables de entorno de freesurfer
export FREESURFER_HOME=/media/DATAPART5/applications/free_surfer_new/freesurfer
export SUBJECTS_DIR=/media/DATAPART5/kmc400/freeSurfer_Tracula

cd tracula
#crear archivo de configuracion para el sujeto
echo "set subjlist = ($subject)" > high_temp_${subject}.conf
echo "set bvecfile = /media/DATAPART5/kmc400/freeSurfer_Tracula/$subject/bvec/bvec.txt" >> high_temp_${subject}.conf
echo "set bvalfile = /media/DATAPART5/kmc400/freeSurfer_Tracula/$subject/bval/bval.txt" >> high_temp_${subject}.conf

cat high.conf >> high_temp_${subject}.conf

#======preproc======

trac-all -prep -c high_temp_${subject}.conf >> $log_file 2>&1
if [ $? -eq 0 ]
then
echo Preproc completed succesfully >> $log_file 2>&1
else
echo Error running Preproc... please check output >> $log_file 2>&1
echo $subject : Error running Preproc... please check output >&2
echo Attempting to continue with fiber tracking anyway >> $log_file 2>&1
echo $subject Attempting to continue with fiber tracking anyway >&2
fi

#====bedpostx====

# ommited in this version


#=====reconstruction=======
trac-all -path -c high_temp_${subject}.conf >> $log_file 2>&1
if [ $? -eq 0 ]
then
echo Path reconstruction completed succesfully >> $log_file 2>&1
else
echo Error in Path reconstruction... please check output >> $log_file 2>&1
echo $subject Error in Path reconstruction... please check output >&2
exit 1
fi

#volver a scripts
cd ..
