# Команды для мониторинга системы
## Информация о системе 
```
uname -a
cat /etc/release
```

## Журналы системы
```
journalctl --since "today"
```

## ЦПУ мониторинг 
```
lscpu
cat /proc/cpuinfo
```
## ЦПУ Загрузка
```
top или htop # cpu in realtime
mpstat [-P ALL] # core info
```

## ЦПУ в определенный период 
```
vmstat 5 10 # статистика каждые 5 секунд 10 раз
sar -u 2 5 # инфо о загрузке каждые 2 секунды 5 раз
```

## Оперативная память 
### Общая инфа
```
free -h
cat /proc/meminfo
```
### Мониторинг использования памяти
```
top или htop # столбцы MEM VIRT
smem
```

## Дисковая подсистема
### Инфо о дисках 
```
df -h
lsblk # список блочных устройств
```

### Активность дисков
```
iotop
iostat -x 5 5 # инфо каждые 5 секунд по 5 раз
```

### Скорость записи диска
```
dd if=/dev/zero of=testfile bs=1G count=1 oflag=direct
rm testfile
```

## Мониторинг сети
### Инфо о сетевых интерфейсах
```
ip a 
ifconfig
```
### Открытые порты
```
netstat -tuln
```

### Сетевая активность
```
iftop
ser -n DEV 5 5
```

### Скорость соединения
```
ping google.com
```

## Диагностика проблем
### Загрузка ЦПУ
```
top или htop
ps aux --sort=-%cpu
journalctl -xe
```