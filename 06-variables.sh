#!/bin/bash

PERSONS=("Siddu" "Seeta" "Siva")

echo "Person name is : ${PERSONS[1]}"

# -- @ - gives all names
echo "Person name is : ${PERSONS[@]}"