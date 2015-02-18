#! /bin/bash
in_path=/home/imagine/T1full
curr_path=$(pwd)
output_file=fslinfo_all.txt
possible_fields=possible_fields.txt
separator=";"

# If file is created, delete it
echo $curr_path
if [ -f $output_file ]
then
  rm $output_file
fi

# Write the line of titles (subject)
echo -n "subject"$separator > $output_file

# Write the all possible titles fields
while read field; do
  echo -n $field$separator >> $output_file
done < $possible_fields

# Add an new line and be ready for the records
echo "" >> $output_file

# Proces each file (with extension .nii.gz) in the input path 
for file in $(find $in_path/*.nii.gz -maxdepth 0 -type f)
do
   # Get rid of the path
   subj_ext=$(basename $file)
   # get rid of .gz extension
   subj="${subj_ext%.*}"
   # Get rif of .nii extension
   subj="${subj%.*}"
   # get rid of T1 trail
   subj=${subj%T1*}
   # Print the subject on screen just to know where we going
   echo $subj
   # Write the subject
   echo -n $subj$separator >> $output_file
   # write the value for each field 
   while read field; do
      # Prepare the awk command
      gawk_cmd=`fslinfo $file | gawk -f gawk_fslinfo_data_extractor.awk key_name=$field`
      # Execute the awk command and output it to the result file
      echo -n $gawk_cmd$separator >> $output_file
   done < $possible_fields
   # Insert a new line
   echo "" >> $output_file
done
