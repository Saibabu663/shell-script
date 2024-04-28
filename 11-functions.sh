#!/bin/bash

userid=$(id -u)


validate(){
    if[ $1 -ne 0]
    then 
        echo "$2.....failure"
        exit 1
    else
        echo "$2.....success"
    fi
}

if [ $userid -ne 0 ] 
then     
    echo "please run this script with root access."
    exit 1 # manually exit if error comes.
    else
        echo "you are super user."
fi
    
dnf install mysql -y
validate $? "installing Mysql"


dnf install git -y
validate $? "installing Mysql"

