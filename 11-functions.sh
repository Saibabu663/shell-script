#!/bin/bash

userid=$(id -u)
TIMESTAMP=$(DATE +%f-%h-%s)
script_name=$($0 |cut -d "." -f1)                                                                                                                -f1

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
    
dnf install mysql -y &>>$logfile
validate $? "installing Mysql"


dnf install git -y &>>$logfile
validate $? "installing git"

