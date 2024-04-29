#!/bin/bash

userid=$(id -u)
TIMESTAMP=$(date +%f-%h-%m-%s)
script_name=$(echo $0 |cut -d "." -f1)                                                                                                            -f1
logfile=/temp/$script_name-$timestamp.log

validate(){
   if [ $1 -ne 0]
   then
        echo "$2...failuru"
        exit 1
    else
        echo "$2...success"
    fi
}

if [ $userid -ne 0 ] 
then     
    echo "please run this script with root access."
    exit 1 # manually exit if error comes.
    else
        echo "you are super user."
fi
    
  for i in $@
  do 
    echo "package to install: $i"
    dnf list installed $i &>>$logfile
    if [$? -ne0 ]
    then
            echo "$i already installed...skipping"
        else
            echo "$i not installed...need to install"
        fi


    done