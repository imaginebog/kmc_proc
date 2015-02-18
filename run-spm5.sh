#!/bin/bash

run_all=run_spm_tmp_5.sh

if [ -f $run_all ]
then
rm $run_all
fi

echo "#!/bin/bash" > $run_all
while read p; do
  echo ./4-SPM_preproc.sh $p >> $run_all
done < spm5.txt

chmod 755 $run_all

./$run_all

rm $run_all
