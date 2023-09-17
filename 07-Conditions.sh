#!/bin/bash

#check if the number is greater than 10 or not?
NUMBER=$1

# gt -->greater than. its an operator
if [ $NUMBER -gt 10]
then
    echo "$NUMBER is greater than 10"
else
    echo "$NUMBER is less than 10"
fi # to end the condition