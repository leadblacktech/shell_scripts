#!/bin/bash                                            

DIRECTORY=$1
MESSAGE=$2                                       
FILE_NAME=$3                                   
FILE_TYPE=$4                                   

cd "$DIRECTORY" || exit

for i in {1..5}; do
  echo "$MESSAGE" | tee -a "$FILE_NAME"_"$i"."$FILE_TYPE" > /dev/null
  done

# Append the message to each file
# loop in the range of 1 to 5
# echo the message and pipe it to the tee command
# tee the output to the file 
# -a append the output to the file instead of overwriting it
# > /dev/null redirect the output to the null device (discard it) no display on the terminal

