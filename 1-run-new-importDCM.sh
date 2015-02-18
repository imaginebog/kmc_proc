#!/bin/bash

run_all=run_all_dcm2nii_new.sh

if [ -f $run_all ]
then
rm $run_all
fi

echo "#!/bin/bash" > $run_all
while read p; do
  echo ./1-importDCM_new.sh $p /media/ExternalDisk/export-andes-19-jun/$p/dicom>> $run_all
done < new2nii.txt

chmod 755 $run_all

./$run_all

rm $run_all
