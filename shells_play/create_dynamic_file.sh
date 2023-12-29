#!/bin/bash

# The directory where the files are located
DIRECTORY=$1

# The message to append
MESSAGE=$2

# Change to the directory
cd "$DIRECTORY" || exit

# Append the message to each file
for i in {1..2}; do
  echo "$MESSAGE" | tee -a VARS_*"$i".txt TMP_*"$i".txt > /dev/null
done