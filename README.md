# Basic Shell Scripting

This project was created to practice shell scripting. Originally I ran the scripts from the command-line. I created a yaml file to call the scripts in an ansible playbook.

There is currently no use case for this repo. Its primarily a playground for leaning. Feel free to contribute, I'm always down to learn.

## Objective

* How to structure simple bash shell commands.
* How to pass arguments to a bash shell.
* Manipulate Folders and Files in a bash shell.

### Goal

* Update and add scripts.
* Learn from advanced scripts.
* Turn this into a tool for future projects.

### Ansible Playbook (yaml)

```yaml
---
- name: Create Directories and Files
  hosts: localhost
  connection: local
  gather_facts: no
  vars:
    dir_pattern: "html,yaml,json"
    file_patterns: ["html/html_1.html", "html/html_2.html", "yaml/yaml_1.yml", "yaml/yaml_2.yml", "json/json_1.json", "json/json_2.json"]
    user_provided_text: "This is the text provided by the user."

  tasks:
    - name: Make Scripts Executable
      file:
        path: "{{ item }}"
        mode: '0755'
      loop:
        - make_dir.sh
        - append_text_to_file.sh

    - name: Make Directories
      shell: "./make_dir.sh {{ item }}"
      loop: "{{ dir_pattern.split(',') }}"
      # args:
      #   executable: /bin/bash

    - name: Create Files and Append text to files
      shell: "./append_text_to_file.sh '{{ item }}' '{{ user_provided_text }}'"
      loop: "{{ file_patterns }}"
      # args:
      #   executable: /bin/bash

```

### Bash Scripts

#### Make Directory Script

```bash
#!/bin/bash

# match the first argument to the script
FOLDERPATTERN=$1

# Create the directory if it does not exist
mkdir -p $FOLDERPATTERN

```

#### Append Text to File Script

```bash
#!/bin/bash

# Pattern is provided as the first argument
FILEPATTERN=$1

# Text to append as the second argument 
TEXT=$2

# Append to the file
for file in $FILEPATTERN; do
    echo "$TEXT" >> "$file"
done

```

### Create Dynamic Folders and Files Playbook

```yaml
---
- name: Append message to files shell script
  hosts: localhost
  gather_facts: no
  vars:
    script_path: "./create_dynamic_files.sh"
    target_directory: "results"
    message_to_append: "Hello its LeadBlackTech"
    file_name: "test"
    file_type: "html"

  tasks:
    - name: Execute the script to append message to files
      shell: "'./create_dynamic_files.sh' '{{ target_directory }}' '{{ message_to_append }}' '{{ file_name }}' '{{ file_type }}'"
      args:
        executable: /bin/bash


# will integrate this script with the previous
# script to create dynamic files
# and append message to them
# Will modify this code to take ansible survey vars as input for the message to append
# will modifyy this code to take ansible prompt vars as input for the message to append

```

#### Create Dynamic Folders and Files

```bash

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

```
