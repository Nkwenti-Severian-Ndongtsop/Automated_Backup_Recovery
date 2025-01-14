#!/bin/bash

# Prompt the user to enter the absolute path of the directory
# echo "Enter the absolute path of the directory: " 

# Check if the directory exists
if [ ! -d "$1" ]; then
    echo "Error: Directory '$1' does not exist."
    exit 1
fi

# Find the directory and store it
mock_files=$(find "$1" -type f)

# Check if any mock files exist
if [ -z "$mock_files" ]; then
    echo "No mock files found in the directory '$1'."
    exit 1
fi

# Create the backup directory if it doesn't exist
backup="/home/ubuntu/backup_folder"
if [ ! -d "$backup" ]; then
    mkdir -p "$backup"
fi

# Archive the mock files
archive="$1.tar"
tar -cvf "$archive" -C "$1" .

# Compress the archive
gzip "$archive"

# Move the compressed archive to the backup directory
mv "$archive.gz" "$backup"

# Store the log in a file
log="$backup/backup.log"
echo "Backup of directory $1 completed at $(date)" >>"$log"

# Log the directory name to file1.txt

# Check if the backup was successful
if [ $? -eq 0 ]; then
echo "$1" >file1.txt
echo "Backup completed successfully!"
else
    echo "Backup failed."
fi
