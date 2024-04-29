#!/bin/bash

userid=$(id -u)
TIMESTAMP=$(date +%f-%h-%m-%s)
script_name=$(echo $0 |cut -d "." -f1)                                                                                                            -f1
logfile=/temp/$script_name-$timestamp.log
R="\e[31m"
G="\e[32m"
N="\e[0m"

validate(){
   if [ $1 -ne 0]
   then
        echo -e "$2...$r failuru $n"
        exit 1
    else
        echo -e "$2...$g success $n"
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
            echo -e "$i already installed...$y skipping $n"
        else
            dnf install $i -y &>>$logfile
            validate $? "installation of $i"
        fi
    done