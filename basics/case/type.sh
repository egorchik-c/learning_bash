#!/bin/bash
read -p "Введите название файла: " file
case $file in
    *.txt)
        echo "Текстовый файл"
        ;;
    *.jpg|*.png)
        echo "Изображение"
        ;;
    *.sh)
        echo "Скрипт"
        ;;
    *)
        echo "ХММММММ что-то странное"
esac