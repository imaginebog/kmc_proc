#! /bin/bash

for subject in $(find * -maxdepth 0 -type d)
do
    cd $subject
    echo "$subject="
    for paradigm in $(find * -maxdepth 0 -type f)
    do
      paradigms[${#paradigms[*]}]=$paradigm
    done
    
    for file in ${paradigms[@]}; do
      fileSize=`stat -c%s $file`
      if [ $fileSize -lt 1000 ]
      then 
         echo -n "Removing... "
         echo -n "$subject "
         echo -n "$file "
         echo "$fileSize"
         rm $file -f
      fi
    done 
 
    paradigms=()
    cd ..

done

