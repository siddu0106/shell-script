#!/bin/bash

APP_LOGS_DIR=/root/app-logs 
DATE=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$0
LOGFILE=/root/shell-script/shelscript-logs/$SCRIPT_NAME-$DATE.log

FILES_TO_DELETE=$(find $APP_LOGS_DIR -name "*.log" -type f -mtime +14)
