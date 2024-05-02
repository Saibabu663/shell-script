#!bin/bash

SOURCE_DIRECTORY=/tmp/app-logs

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ -d $SOURCE_DIRECTORY ]
then
    echo -e  "source directory exists"
else
    echo -e "please make sure $SOURCE exists $N"
    exit1
fi