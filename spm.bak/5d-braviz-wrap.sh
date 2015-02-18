#! /bin/bash

if [ $# -lt 1 ]
then
echo Usage: $0 subject
exit 0
fi


function run {
echo wrapping
#timeut in 30 minutes
subject_dir=/media/DATAPART5/kmc400/spm/$subject
doalarm 1800 $matlab -r "wrap_braviz('$subject_dir')"
echo $subject_dir

if [ $? -eq 0 ]
then
echo
echo "Wrapping of subject $subject completed succesfully"
else
echo Error running SPM... please check output
echo Error running SPM... please check output >&2
result=1
fi 

}

subject=$1
pdgm=$2
matlab=/usr/local/MATLAB/R2013a/bin/matlab
log_file=$(pwd)/logs/SPM_${2}_${1}_braviz.txt
echo $log_file
cd /media/DATAPART5/kmc400/scripts/spm
echo running $0 $1 > $log_file
echo started $1 : $(date) >> $log_file
echo >> $log_file
result=0
run >> $log_file 2>&1
if [ ! $result -eq 0 ]
then
echo Error running $0 $1 $2 please check output >&2
fi
#===============================================
# retornar a scripts
cd -

