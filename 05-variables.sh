#!/bin/bash

echo "the user is"

read -s USERNAME

echo "user is : $USERNAME"

echo "the pwd is"

read -s PASSWORD # -s --> no one will see what we are entering

echo "pwd is : $PASSWORD"