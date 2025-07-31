#!/bin/bash
echo -n "Ваше число "
if [ $1 -gt 10 ]; then
    echo "больше 10" 
elif [ $1 -lt 10 ]; then
    echo "меньше 10"
else 
    echo "равно 10"
fi