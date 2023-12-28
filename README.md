# Basic Shell Scripting

This project was create to practice shell scripting. Originally I ran the scripts from the command-line. I created a yaml file to call the scripts in an ansible playbook. 

There is currently no use case for this repo. Its primarily a playground for leaning. Feel free to contribute, I'm always down to learn.

### Objective:

* How to structure simple bash shell commands.
* How to pass arguments to a bash shell.
* Manipulate Folders and Files in a bash shell.

Goal: 

* Update and add scripts.
* Learn from advanced scripts.
* Turn this into a tool for future projects.

## Scripts:

##### Make Directory Scripts

```
#!/bin/bash

# match the first argument to the script
FOLDERPATTERN=$1

# Create the directory if it does not exist
mkdir -p $FOLDERPATTERN

```


##### Append Text to File Script

```
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

```
