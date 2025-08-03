#!/bin/bash

factorial() {
    local n=$1
    if [[ $n -le 1 ]]; then
        echo 1
    else 
        local prev=$(factorial $((n-1)))
        echo $((n*prev))
    fi
}

read -p "Write the number: " num

if [[ $num -lt 0 ]]; then
    echo "Error: negative number"
    exit 1
fi

result=$(factorial "$num")
echo "Factorial $num = $result"