#!/bin/bash

VAR1=$1
VAR2=$2

echo "1st variable : $VAR1"
# @ --> all
echo "all var : $@"

# - means how many varibals are passed
echo "how many variabes are there : $#"