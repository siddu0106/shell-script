#!/bin/bash

VAR1=$1
VAR2=$2

# to know the script name 
echo "ScriptName : $0"

echo "1st variable : $VAR1"
# @ --> all
echo "all var : $@"

# - means gives count how many varibals are passed
echo "how many variabes are there : $#"