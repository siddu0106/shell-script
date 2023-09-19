#!/bin/bash

DATE=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$0
LOGFILE=/tmp/$SCRIPT_NAME-$DATE.log

VALIDATE()
{
    #$1 --> It will receive the argument 1
    #$2 --> argument 2 --> to know the name
    if [ $1 -ne 0 ]
    then
        echo  "ERROR : $2 is not success"
        exit 1
    else 
        echo "SUCCESS : $2 is success"
    fi
}

#print 1-100 numbers

for i in {1..100}
do
    echo "$i"
done

#all arguments are in $@
for j in $@
do
    yum installl $j -y &>>$LOGFILE
    VALIDATE $? $j
done

