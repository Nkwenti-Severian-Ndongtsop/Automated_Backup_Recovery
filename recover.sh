#!/bin/bash

#check if the file is empty
if [ -z $content ]; then
content=$(cat file1.txt)
fi

# Extract the compressed file
path=$(echo $content | cut -d '/' -f 1-3)
end=$(basename "$content")
compress=$(find "$path/backup_folder/${end}.tar.gz" -type f)
mkdir -p "$content"
tar -xzvf "$compress" -C "$content"

# Store the log in a file
log_file="/home/ubuntu/backup_folder/backup.log"
echo "Recovery of directory $content completed at $(date)" >>"$log_file"
