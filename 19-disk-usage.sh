#!/bin/bash

DISK_USAGE=$(df -hT | grep xfs)
DISK_THRESHOLD=6
MESSAGE=""

while IFS= read -r line
do 
    USAGE=$(echo $line | awk -F " " '{print $6F}' | cut -d "%" -fl)
    FOLDER=$(echo $line | awk -F " " '{print $NF}')
    if [ $USAGE  $DISK_THRESHOLD ]
    then
        MESSAGE+="$FOLDER IS MORE THAN  $DISK_THRESHOLD, CURRENT USAGE: $USAGE"\n"
    fi
done <<< $DISk_USAGE

echo -e "MESSAGE: $MESSAGE"


