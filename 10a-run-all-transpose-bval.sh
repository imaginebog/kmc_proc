#!/bin/bash

subjects_file=faltantes_freesurfer.txt


while read subj; do
  ./10-Transpose_bval_files.sh $subj
done < $subjects_file
