#!/bin/bash

DATE=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$0
LOGFILE=/tmp/$SCRIPT_NAME-$DATE.log

R="\e[31m"
G="\e[30m"
Normal="\e[0m"

VALIDATE()
{
    #$1 --> It will receive the argument 1
    #$2 --> argument 2 --> to know the name
    if [ $1 -ne 0 ]
    then
        echo -e "$R ERROR : $Normal $2 is not success"
        exit 1
    else 
        echo -e "$G SUCCESS : $Normal $2 is success"
    fi
}

#1. check user is root or not
USER=$(id -u)

#this function is used to check the previous command status success or not

if [ $USER -ne 0 ]
then 
    echo "ERROR : Not a Root user. Please use sudo su - command"
    # it is our responsibility to check the command status. 1-127 not success.
    # if it's failure then stop don't proceed
    exit 1
else
    echo "SUCCESS : Root user"
fi

#2. Install Mysql Package 

#I am storing the logs in this location not in terminal
yum install mysql -y &>>$LOGFILE

#Provide ext status input
VALIDATE $? "MySQL Installation"

#3. Install postfix package for GMAIL

yum install postfix -y &>>$LOGFILE

VALIDATE $? "Postfix installation"


