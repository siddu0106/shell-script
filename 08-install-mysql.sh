#!/bin/bash

#1. check user is root or not
USER=$(id -u)

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

#3. Check for the command status 

if [ $? -ne 0 ]
then
    echo "ERROR : Installation of Mysql is not success"
    exit 1
else 
    echo "SUCCESS : Installation of Mysql is success"
fi

#3. Install postfix package for GMAIL

yum install postfix -y

if [ $? -ne 0 ]
then
    echo "ERROR : Installation of postfix is not success"
    exit 1
else 
    echo "SUCCESS : Installation of postfix is success"
fi


