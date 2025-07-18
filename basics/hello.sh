#!/bin/bash
echo "Hello world!"

var="Hello"
# "" - пропускают знак $ 
# '' - строгие кавычки

echo "Переменная $var"

x=2
y=3
echo $x+$y # 2+3
echo $(($x+$y)) # 5