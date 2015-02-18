#! /bin/awk -f
BEGIN { FIELDWIDTHS = "15 10" } # ColHeaders:  key value 
NF && !/^[:space:]*#/ {
   key=$1
   value=$2
   sub(/^  */, "", key)   # strip leading spaces 
   sub(/ *$/, "", key)   # strip trailing spaces 
   sub(/^  */, "", value)   # strip leading spaces 
   sub(/ *$/, "", value)   # strip trailing spaces
   #print key;
   #print value;

   if (key_name == key){
       print value;
   }
}

