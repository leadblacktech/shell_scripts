#!/bin/bash
# wite to file with no new line
while true; do
  echo "-n" "$@ " >> file.txt
  sleep 1
done

