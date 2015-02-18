#!/bin/bash

run_all=run_all_dcm2niideyberth.sh

if [ -f $run_all ]
then
rm $run_all
fi

echo "#!/bin/bash" > $run_all
while read p; do
  echo ./1-importDCMdeyberth.sh $p /media/backups/kmc400/new_nii/$p/dicom>> $run_all
done < 2nii.txt

chmod 755 $run_all

./$run_all

rm $run_all