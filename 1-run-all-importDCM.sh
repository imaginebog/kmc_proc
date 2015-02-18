#!/bin/bash

run_all=run_all_dcm2nii.sh

if [ -f $run_all ]
then
rm $run_all
fi

echo "#!/bin/bash" > $run_all
while read p; do
  echo ./1-importDCM.sh $p /media/DATAPART5/kmc400/ftp/Data/DataMay2014/$p/dicom>> $run_all
done < 2nii.txt

chmod 755 $run_all

./$run_all

rm $run_all
