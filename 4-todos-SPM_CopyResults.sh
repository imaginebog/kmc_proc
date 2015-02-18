#!/bin/bash

while read p; do
   echo "Processing subject $p..."
   ./4b-Copy_Results.sh $p
   echo "Done subject $p!"
done < in_CopyResults.txt
