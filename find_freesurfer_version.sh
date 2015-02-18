
cd logs
while read subj; do
    echo -n "$subj;"
    file="freeSurfer_$subj.txt"

    if [ -f $file ]; then
        cat $file | grep "Subject Stamp:"
    else
       echo "File not Found"
    fi
done < ../lista_pablo.txt

cd ..
