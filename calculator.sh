#!/bin/bash

echo "Enter first number"
read -r n1

echo "Enter second number"
read -r n2



re='^[0-9]+$'

if [[ "$n1" =~ $re && "$n2" =~ $re ]];
then
    echo "Choose an operation:"
    echo "[ + | - | * | / ]"
    read -r operation
else
echo "Not numbers, get out"
    exit 1
fi

case $operation in
    "+")
        echo $(($n1+$n2))
        ;;
    "-")
        echo $(($n1-$n2))
        ;;
    "*")
        echo $(($n1*$n2))
        ;;
    "/")
        echo $(($n1/$n2))
        ;;
    *)
        echo "invalid choice"
        ;;
esac