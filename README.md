# Basic Shell Scripting

This project was create to practice shell scripting. Originally I ran the scripts from the command-line. I created a yaml file to call the scripts in an ansible playbook.

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

# Text to append
TEXT=$2

# Append to the file
# Here we need to remove the curly braces as they are not part of the actual filenames
for file in $FILEPATTERN; do
    echo "$TEXT" >> "$file"
done

```
