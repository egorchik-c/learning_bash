#!/bin/bash

arr=(20 40 50 30 3 4)
max=0

for i in ${!arr[@]}; do
    if [[ ${arr[$i]} -gt $max ]]; then
        max=${arr[$i]}
    fi 
done

echo "Max element in array[${arr[@]}] is: $max"