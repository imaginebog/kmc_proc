#! /bin/awk -f
BEGIN { FIELDWIDTHS = "4 4 9 12 34" } # ColHeaders:  Index SegId NVoxels Volume_mm3 StructName 
NF && !/^[:space:]*#/ {
   struct_name=$5
   mm3=$4
   sub(/^  */, "", struct_name)   # strip leading spaces 
   sub(/ *$/, "", struct_name)   # strip trailing spaces 
   sub(/^  */, "", mm3)   # strip leading spaces 
   sub(/ *$/, "", mm3)   # strip trailing spaces
   #print struct_name;
   #print struct;

   if (struct == struct_name){
       print mm3;
   }
   #print mm3;
}

