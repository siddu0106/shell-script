#!/bin/bash

DATE=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$0
LOGFILE=/root/shell-script/shelscript-logs/$SCRIPT_NAME-$DATE.log

R="\e[31m"
N="\e[0m"
Y="\e[33m"
G="\e[32m"

VALIDATE()
{
    #$1 --> It will receive the argument 1
    #$2 --> argument 2 --> to know the name
    if [ $1 -ne 0 ]
    then
         echo -e $R "ERROR : $2 is not success" $N
        exit 1
    else 
        echo -e $G "SUCCESS : $2 is success" $N
    fi
}

echo "Script Name : $SCRIPT_NAME"

USER=$(id -u)

if [ $USER -ne 0 ]
then 
    echo -e $R"ERROR : Not a Root user. Please use sudo su - command"$N
    # it is our responsibility to check the command status. 1-127 not success.
    # if it's failure then stop don't proceed
    exit 1
else
    echo -e $G "SUCCESS : Root user" $N
fi

#print 1-100 numbers

for i in {1..100}
do
    echo "$i"
done

#all arguments are in $@
for i in $@
do
    #command to check wether the package is installed or not
    yum list installed $i
    if [ $? -ne 0 ]
    then
        echo -e $i "is not installed. Lets Install it" $N
        yum install $i -y &>>$LOGFILE
        VALIDATE $? $i
    else
        echo -e  $Y "$i is already installed... " $N
    fi
done

