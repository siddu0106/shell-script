#!/bin/bash

DATE=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$0
LOGFILE=/tmp/$SCRIPT_NAME-$DATE.log

R="\e[31m"
N="\e[0m"

VALIDATE()
{
    #$1 --> It will receive the argument 1
    #$2 --> argument 2 --> to know the name
    if [ $1 -ne 0 ]
    then
        echo -e "$R ERROR : $2 is not success $N"
        exit 1
    else 
        echo "SUCCESS : $2 is success"
    fi
}

USER=$(id -u)

if [ $USER -ne 0 ]
then 
    echo -e "$R ERROR : Not a Root user. Please use sudo su - command $N"
    # it is our responsibility to check the command status. 1-127 not success.
    # if it's failure then stop don't proceed
    exit 1
else
    echo "SUCCESS : Root user"
fi

#print 1-100 numbers

for i in {1..100}
do
    echo "$i"
done

#all arguments are in $@
for j in $@
do
    yum install $j -y &>>$LOGFILE
    VALIDATE $? $j
done

