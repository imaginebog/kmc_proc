#!/bin/bash

function run {
echo started $1 : $(date)
echo ./8-Camino_tractography.sh $1
./8-VTK-Camino_tractography.sh $1 &

}

exec < faltantes_camino_vtk.txt
while read subject
do
         while [ $(ps -a | grep 8-VTK | wc -l) -ge 14 ]
         do
            sleep 10s
         done
         sleep 2s
         run $subject 
done
