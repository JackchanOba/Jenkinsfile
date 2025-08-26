#!/bin/bash
# MMORPG server maintenance: clean logs older than 7 days
LOG_DIR="/var/log/mmorpg"
find $LOG_DIR -name "*.log" -mtime +7 -exec rm -f {} \;
echo "Logs cleaned on $(date)"
