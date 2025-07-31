#!/bin/bash
read -p "Введите первое число: " num1
read -p "Введите второе число: " num2
read -p "Введите операцию (+, -, *, /): " op

echo -n "Результат: "
case $op in
    "+")
        echo $(($num1 + $num2))
        ;;
    "-")
        echo $(($num1 - $num2))
        ;;
    "*")
        echo $(($num1 * $num2))
        ;;
    "/")
        if [ $num2 -eq 0 ]; then
            echo "Ошибка деления на 0"
        else
            echo $(($num1 / $num2))
        fi
        ;;
    *)
        echo "Неизвестная операция"
        ;;
esac