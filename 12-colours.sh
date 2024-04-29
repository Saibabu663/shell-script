#!/bin/bash

userid=$(id -u)
TIMESTAMP=$(DATE +%f-%h-%m-%s)
script_name=$(echo $0 |cut -d "." -f1)                                                                                                                -f1

logfile=/temp/$script_name-$timestamp.log
R="le[31m"
G="le[32m"
N="le[0m"


echo "script started ececuting at: $timestamp"
validate(){
   if [ $1 -ne 0]
   then
        echo -e "$2...$r failuru" $N"
        exit 1
    else
        echo "$2...$G success" $N
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

