#! /bin/bash

# Function that given an element and an array returns 1 if the element is included in the array, 0 otherwise.
containsElement () {
    local e
    for e in "${@:2}"; 
    do 
        [[ "$e" == "$1" ]] && return 1; 
    done
    return 0
}

separator=","
all_paradigms=(ATENCIONSENSE COORDINACIONSENSE MEMORIASENSE MIEDOSofToneSENSE PRENSIONSENSE)
subject_paradigms=()
spmPath=/media/DATAPART5/kmc400/spm/
scriptsPath=/media/DATAPART5/kmc400/scripts/
firstLevelScript=/media/DATAPART5/kmc400/scripts/5b-First_Level_Others.sh

cd $spmPath
#pwd
# Iterate over all subject directories
for subject in $(find * -maxdepth 0 -type d)
do
    # Get into the subject directory
    cd $subject
    echo "*** $subject ***"
    # Populate an array with the paradigms that the current subject has
    for paradigm in $(find * -maxdepth 0 -type d)
    do
        if [[ "$paradigm" != "T1" ]] 
	then
	        echo -n "$paradigm"
	#       subject_paradigms[${#subject_paradigms[*]}]=$paradigm
	        if [ ! -d $paradigm/FirstLevel ]
	        then
	           echo -n "-No FirstLevel"
                   cd $scriptsPath 
	           $firstLevelScript $subject $paradigm
                   cd $spmPath$subject
	        fi
	        echo ""
	fi
    done
    
#    # Iterate over all possible paradigms
#    for paradigm in ${all_paradigms[*]}
#    do
#       echo $paradigm" "
#       # Ask if the current paradigm is included in the all possible paradigms
#       containsElement $paradigm "${subject_paradigms[@]}"
#       val=$?
#       if [[ $val == 1 ]]
#       then
#          echo -n " Found - "
#       else
#          echo -n " Not Found - "
#       fi
#
##       echo -n $val$separator
#
#       # Ask if the current paradigm has the firstlevel directory
##       if [ -d $paradigm/FirstLevel ]
##       then
##          # Get the number of files inside the fistleve directory
##          numberOfFiles=`ls $paradigm/FirstLevel | wc -l`
##          # If it has files, then echoes 1, 0 otherwise
##          if [[ $numberOfFiles > 0 ]]
##          then
##              echo -n "1"$separator
##          else
##              echo -n "0"$separator
##          fi
##       else
##           echo -n "0"$separator
##       fi 
#    done
#
#
#    subject_paradigms=()
#    echo "" 
    cd ..

done

cd /media/DATAPART5/kmc400/scripts
