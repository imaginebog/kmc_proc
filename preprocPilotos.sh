#! /bin/bash

#Procesar los pilotos para mirar en Montreal


echo starting
 ./4-SPM_preproc.sh 2 > preproc2.txt 
 ./4-SPM_preproc.sh 20 > preproc20.txt 
 ./4-SPM_preproc.sh 221 > preproc221.txt 
 ./4-SPM_preproc.sh 3 > preproc3.txt 
 ./4-SPM_preproc.sh 500 > preproc500.txt 
 ./4-SPM_preproc.sh 645 > preproc645.txt 
 ./4-SPM_preproc.sh 730 > preproc730.txt 
 ./4-SPM_preproc.sh 992 > preproc992.txt 

echo completed preprocessing

echo zipping

cd /media/DATAPART5/kmc400/spm
#=========================
cd 2
7z a miedo.7z MIEDOSofToneSENSE/sw*BOLD-0*
7z a t1 T1
7z a first.7z MIEDOSofToneSENSE/FirstLevel
cd ..

cd 20
7z a miedo.7z MIEDOSofToneSENSE/sw*BOLD-0*
7z a t1 T1
7z a first.7z MIEDOSofToneSENSE/FirstLevel
cd ..

cd 3
7z a miedo.7z MIEDOSofToneSENSE/sw*BOLD-0*
7z a t1 T1
7z a first.7z MIEDOSofToneSENSE/FirstLevel
cd ..

cd 500
7z a miedo.7z MIEDOSofToneSENSE/sw*BOLD-0*
7z a t1 T1
7z a first.7z MIEDOSofToneSENSE/FirstLevel
cd ..

cd 559
7z a miedo.7z MIEDOSofToneSENSE/sw*BOLD-0*
7z a t1 T1
7z a first.7z MIEDOSofToneSENSE/FirstLevel
cd ..


cd 645
7z a miedo.7z MIEDOSofToneSENSE/sw*BOLD-0*
7z a t1 T1
7z a first.7z MIEDOSofToneSENSE/FirstLevel
cd ..

cd 730
7z a miedo.7z MIEDOSofToneSENSE/sw*BOLD-0*
7z a t1 T1
7z a first.7z MIEDOSofToneSENSE/FirstLevel
cd ..

cd 992
7z a miedo.7z MIEDOSofToneSENSE/sw*BOLD-0*
7z a t1 T1
7z a first.7z MIEDOSofToneSENSE/FirstLevel
cd ..

 find -iwholename *.7z -exec scp {} imagine@guainia:/media/DATAPART1/web/braviz/{} \;

#=========================
cd /media/DATAPART5/kmc400/scripts

