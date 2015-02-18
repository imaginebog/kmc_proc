#! /bin/bash

#paradigmas=(ATENCIONSENSE COORDINACIONSENSE MEMORIASENSE MIEDOSofToneSENSE PRENSIONSENSE)
paradigmas=(COORDINACIONSENSE)


while read p; do
   echo -n "[$p]"
   for pdgm in ${paradigmas[*]}
   do
     echo -n " $pdgm "
     if [ -d /media/DATAPART5/kmc400/spm/$p/$pdgm ] #Verificar si existe el directorio del paradigma en el sujeto
     then 
         if [ -d /media/DATAPART5/kmc400/spm/$p/$pdgm/FirstLevel ] #Verificar si existe el directorio FirstLevel del paradigma en el sujeto
         then
             echo "Zipping FirstLevel $pdgm subject $p..."
             mkdir -p /media/ExternalDisk/ZipFirstLevel/$p/
             zip -r /media/ExternalDisk/ZipFirstLevel/$p/$pdgm.zip /media/DATAPART5/kmc400/spm/$p/$pdgm/FirstLevel
             echo "Done $pdgm subject $p!"
         fi
      fi
   done
   echo " Done!"
done < left2runCOORDINACION.txt 

