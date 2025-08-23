#!/bin/bash

echo "Добро пожаловать в валидатор паролей!"
echo "Пароль должен соответствовать следующим критериям:"
echo "  - Не менее 8 символов"
echo "  - Содержит цифру (0-9)"
echo "  - Содержит букву в нижнем регистре (a-z)"
echo "  - Содержит букву в верхнем регистре (A-Z)"
echo ""

read -sp "Введите ваш пароль: " PASSWORD
echo ""

is_valid=true

if [[ ! ${#PASSWORD} -ge 8 ]]; then
    is_valid=false
    echo "Ошибка: Длина должна быть больше 8"
fi

if [[ ! "$PASSWORD" =~ [0-9] ]]; then
    is_valid=false
    echo "Ошибка: Должна быть цифра в пароле"
fi

if [[ ! "$PASSWORD" =~ [a-z] ]]; then
    is_valid=false
    echo "Ошибка: Должна быть [a-z] в пароле"
fi

if [[ ! "$PASSWORD" =~ [A-Z] ]]; then
    is_valid=false
    echo "Ошибка: Должна быть [A-Z] в пароле"
fi

echo -e "\n-----------Вердикт-----------"

if $is_valid; then
    echo "Пароль прошел проверку!"
    exit 0
else 
    echo "Пароль не прошел проверку!"
    exit 1
fi