#!/bin/bash

function run {
echo started $1 : $(date)
echo ./13-spm_preproc_fl.sh $1
./13-spm_preproc_fl.sh $1 &

}

exec < lista_pablo_faltantes.txt
while read subject
do
    while [ $(ps -a | grep 13-spm | wc -l) -ge 7 ]
    do
       sleep 10s
    done
    sleep 1s
    run $subject
done
