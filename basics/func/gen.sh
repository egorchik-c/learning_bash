#!/bin/bash

gen_pass() {
    local len=$1
    if [[ ! "$len" =~ ^[0-9]+$ ]]; then
        echo "Error: must be a value!"
        return 1
    fi

    local pass=$(tr -dc 'A-Za-z0-9' < /dev/random | head -c "$len")
    echo "$pass"
}

read -p "Length: " len

echo "Password is: $(gen_pass "$len")"