#!/bin/bash

# Pattern is provided as the first argument
FILEPATTERN=$1

# Text to append
TEXT=$2

# Append to the file
# Here we need to remove the curly braces as they are not part of the actual filenames
for file in $FILEPATTERN; do
    echo "$TEXT" >> "$file"
done
