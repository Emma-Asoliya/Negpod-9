#!/usr/bin/env bash
# Remote server details
REMOTE_USER="ec1ebc754f75"
REMOTE_HOST="ec1ebc754f75.a5efec7a.alu-cod.online"
REMOTE_PASS="ea1d8f222b11d7be18f6"
REMOTE_DIR="/summative/0524-2024m"
LOCAL_DIR="negpod_9-q1"

# Check if the local directory exists
if [ ! -d "$LOCAL_DIR" ]; then
    echo "Directory $LOCAL_DIR does not exist."
    exit 1
fi

# Use expect to automate the password entry for scp
expect <<EOF
spawn scp -r $LOCAL_DIR ${REMOTE_USER}@${REMOTE_HOST}:${REMOTE_DIR}
expect {
    "password:" {
        send "$REMOTE_PASS\r"
        exp_continue
    }
    eof
}
EOF

# Check if the scp command was successful
if [ $? -eq 0 ]; then
    echo "Backup completed successfully."
else
    echo "Backup failed."
fi
