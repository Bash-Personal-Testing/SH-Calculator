#!/bin/bash

declare extensions=( "txt" "py" "ts" "doc")

read -r -p "How many of each filetype: " n
rm -r parent
mkdir -p parent
cd parent || exit

for ext in "${extensions[@]}";
do
    for name in $(seq "$n");
    do
        touch "$name.$ext"
    done
done