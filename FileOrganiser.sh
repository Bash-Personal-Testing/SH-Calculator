#!/bin/bash

read -r -p "Enter path for file to organise: " dir

while [[ ! -d "$dir" ]];
do
    echo "Please enter a valid directory path"
    read -r -p "Enter path for file to organise: " dir
done

if [[ -z "$(ls -A "$dir")" ]]; then
    echo "Directory is empty"
    exit 0
fi

mapfile files < <(find ./"$dir" -maxdepth 1 -type f | grep -v "^./\." )
for path in "${files[@]}"; do
    filename=$(echo "$path" | xargs basename)
    currentExtension=$(echo "$path" | xargs basename | cut -d "." -f 2- )
    echo "$currentExtension"
    
    mkdir -p "$dir"/"$currentExtension"
    mv -v "$dir/$filename" "$dir/$currentExtension/$filename"
done