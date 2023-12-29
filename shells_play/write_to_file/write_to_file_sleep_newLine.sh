# will write to file with a new line each time
#!/bin/bash

while true; do
  echo "$* " >> file.txt
  sleep 1
done