
while read subj; do
    echo "Moving $subj ..."
    mv /media/DATAPART5/kmc400/freeSurfer_Tracula/$subj /media/DATAPART5/kmc400/freeSurfer_Tracula/olds
    echo "Done!"
done < faltantes_freesurfer.txt

