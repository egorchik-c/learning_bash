# Базовые команды *bash*
## Обработка текста
### Alias
Псевдоним для длинных команд 
```
alias name='command' 
alias # покажет все псевдонимы
unalias name # удалит псевдоним
```
При вызове команды **name**, произовдет вызов **command**.
Для добавление перманентного псевдонима менять '**nano ~/.bashrc**'

### Grep
Синтакссис
```
grep 'слово' файл
cat file | grep 'слово'
```

### Awk
Используется для сканирования шаблонов и обработки языка.
```
awk -F"," '{print $1}' filename.csv # извлечение первого столбца из файла
```

Параметры 
- -F - разделитель полей данных
- -v - установка переменной
- -f - файл в качестве источника *awk*

Пример 
```
awk -F"," '{sum += $3} END {print sum}' filname.csv
```

### Sed
Потоковый редактор, используемый для вполнения базовых текстовых преобразований во входном потоке.
Чтобы заменить первое вхождение шаблона в файле, используйте:
```
sed 's/old/new/' filename
```
Пример 
```
sed 's/World/Bash/' example.txt
# Вывод
~ Hello Bash
~ Line 1
~ Line 2
```

Регулярные выражения
```
sed -r 's/(World|Line)/Hello/g' example.txt
# Вывод
~ Hello Hello
~ Hello 1
~ Hello 2
```
Скрипт из файла и префикс
```
sed -f script.sed example.txt

sed 's/^/Line: /' example.txt # Добавит Line: к каждой строке
```

### Cut
Вырезка секций из файлов.
```
cut -f1 filename
# -f1 - извелекает первое поле файла

cut -f2-3 file.txt
# -f2-3 - извлекает второе и третье поле из файла
```

Разделитель *-d*:
```
cut -d',' -f1 file.txt # Покажет поля без разделителя
```
*--complement* - покажет все поля, кроме выбранных

### Sort
Сортировка строк в текстовом файле
```
sort filename.txt
sort -r # reverse
e.t.c
```

## System Monitoring
### ps
Вывод текущих процессов.
```
ps -e # all processes
```
### top
Выводит задачи линукса
```
top
```

### df
Информация о файловом пространстве
```
df
```

### du
Оценка использования файлового пространства
```
du
```

### free
Объем свободной или использованной памяти
```
free -k|m|g # Кб|Мб|Гб
```

### kill
Завершение процессов

```
kill option PID
```

### uptime
Информация о работе системы

## Networking

### scp
Безопасная передача файлов
```
scp file.txt user@example.com:/home/user/
```

### rsync 
Синхронизация каталогов между компьютерами
```
rsync -avz /local/dir/ user@example.com:/remote/dir
```

## File permissions

```
rwxrwxrwx # владелец|группа|другие
chown # изменить права владельца
chmod # изменить права доступа к файлу
chgrp # ищменить права группы
```

Права доступа в цифрах
```
0 - no permission
1 - execute
2 - write
4 - read

Example
1 + 2 + 4 = 7 - read, write and execute

chmod 755 file.sh
```

Базовый синтаксис
```
chmod option file
chown [option] user[:group] file
chgrp [option] group file
```
