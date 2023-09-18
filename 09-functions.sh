#!/bin/bash

#1. check user is root or not
USER=$(id -u)

#this function is used to check the previous command status success or not
VALIDATE()
{
    #$1 --> It will receive the argument 1
    #$2 --> argument 2
    if [ $1 -ne 0 ]
    then
        echo "ERROR : $2 is not success"
        exit 1
    else 
        echo "SUCCESS : $2 is success"
    fi
}

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

yum install mysql -y

#Provide ext status input
VALIDATE $? "MySQL Installation'

#3. Install postfix package for GMAIL

yum install postfix -y

VALIDATE $? "Postfix installation"


