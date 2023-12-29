#!/bin/bash

# The directory where the files are located
DIRECTORY=$1

# The message to append
MESSAGE=$2

# This is the file type
FILE_TYPE=$3

# Change to the directory
cd "$DIRECTORY" || exit

# Append the message to each file
for i in {1..2}; do
  echo "$MESSAGE" | tee -a vars_*"$i".txt tmp_*"$i".txt > /dev/null
done