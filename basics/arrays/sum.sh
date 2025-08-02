#!/bin/bash
arr=(10 20 30 40)
sum=0

for i in ${!arr[@]}; do
    sum=$((sum+${arr[$i]}))
done 

echo "Сумма элеметнов: $sum"