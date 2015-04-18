#!/bin/bash
FILES=/home/user/toExecute/*
folder="/home/user/toExecute/"
Done=/home/user/executed/
logFile=/home/user/executed/userFtpCreated.log
if find "$folder" -maxdepth 0 -empty | read v; then exit; fi
for f in $FILES
do
  echo "Processing $f file..."
  file=$(basename "$f")
  # take action on each file. $f store current file name
  while read name pass; do
    sh /var/www/html/userqv/app/Console/Command/createFtpUser.sh "$name" "$pass"
    echo "$name"
    echo "$pass"
    NOW=$(date +"%Y-%m-%d %H-%M")
    echo "$NOW arquivo $file processado e criado o usuario $name" >> "$logFile"
  done < "$f"

  echo "Moving $f file ...."
  mv "$f" "$Done""$file"
done
