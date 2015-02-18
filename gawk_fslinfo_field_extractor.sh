#! /bin/awk -f
BEGIN { FIELDWIDTHS = "9" } # ColHeaders:  Datatype 
NR>1 {
   field_name=$1
   sub(/^  */, "", field_name)   # strip leading spaces 
   sub(/ *$/, "", field_name)   # strip trailing spaces 
   print field_name;
}

