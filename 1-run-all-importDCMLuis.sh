#!/bin/bash

run_all=run_all_dcm2niiluis.sh

if [ -f $run_all ]
then
rm $run_all
fi

echo "#!/bin/bash" > $run_all
while read p; do
  echo ./1-importDCMLuis.sh $p /media/backups/Dicom/$p/dicom >> $run_all
done < faltantes.txt

chmod 755 $run_all

./$run_all

rm $run_all
