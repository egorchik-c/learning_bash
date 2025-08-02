#!/bin/bash
arr=(file.txt file.doc file2.txt file3.sh)
echo "Before: ${arr[@]}"

for i in ${!arr[@]}; do
    if [[ ${arr[$i]} != *txt ]]; then
        unset arr[$i]
    fi
done

echo "After: ${arr[@]}"