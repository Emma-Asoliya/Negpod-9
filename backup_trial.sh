#!/bin/bash

# Variables
DIRECTORY="negpod_9-q1"
REMOTE_USER="ec1ebc754f75"      # Replace with your remote server username
REMOTE_HOST="ec1ebc754f75.a5efec7a.alu-cod.online"      # Replace with your remote server hostname or IP
REMOTE_DIR="/summative/0524-2024m" # Replace with the remote backup directory

# Check if the directory exists
if [ -d "$DIRECTORY" ]; then
  # Create a tarball of the directory
  TAR_FILE="${DIRECTORY}.tar.gz"
  tar -czf "$TAR_FILE" "$DIRECTORY"
  
  # Copy the tarball to the remote server
  scp "$TAR_FILE" "$REMOTE_USER@$REMOTE_HOST:$REMOTE_DIR"
  
  # Check if the copy was successful
  if [ $? -eq 0 ]; then
    echo "Backup successful."
    # Optionally, remove the local tarball after successful backup
    rm "$TAR_FILE"
  else
    echo "Backup failed."
  fi
else
  echo "Directory $DIRECTORY does not exist."
fi

