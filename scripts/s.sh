#!/bin/bash

# --- Конфигурация ---
# Дирректория, которую нужно архивировать
SOURCE_DIR="$HOME/projects"  # Измените на свой путь
# Дирректория, куда будет сохраняться бэкап
BACKUP_DIR="$HOME/backups"   # Измените на свой путь
# Имя файла бэкапа (будет дополнено датой)
BACKUP_NAME="my_project_backup"
# Количество дней, за которые хранить бэкапы
RETENTION_DAYS=7

# --- Создание дирректории для бэкапов, если её нет ---
mkdir -p "$BACKUP_DIR"

# --- Формирование имени файла с датой ---
# Формат: my_project_backup_2024-12-19_10-30-25.tar.gz
TIMESTAMP=$(date +%Y-%m-%d_%H-%M-%S)
BACKUP_FILE="$BACKUP_DIR/${BACKUP_NAME}_${TIMESTAMP}.tar.gz"

# --- Логирование ---
echo "[$(date +%Y-%m-%d\ %H:%M:%S)] Запуск резервного копирования..."
echo "Источник: $SOURCE_DIR"
echo "Цель: $BACKUP_FILE"

# --- Проверка существования исходной директории ---
if [ ! -d "$SOURCE_DIR" ]; then
    echo "ОШИБКА: Исходная директория ($SOURCE_DIR) не найдена!" >&2
    exit 1
fi

# --- Создание архива ---
# -czf: Create, Zip, File
# --exclude: Исключает ненужные файлы (настройте под себя)
if tar -czf "$BACKUP_FILE" \
    -C "$(dirname "$SOURCE_DIR")" \
    --exclude="node_modules" \
    --exclude=".cache" \
    "$(basename "$SOURCE_DIR")"; then
    # Проверяем размер созданного файла
    FILESIZE=$(du -h "$BACKUP_FILE" | cut -f1)
    echo "[$(date +%Y-%m-%d\ %H:%M:%S)] Резервная копия успешно создана! Размер: $FILESIZE"
else
    echo "ОШИБКА: Не удалось создать архив!" >&2
    exit 1
fi

# --- Удаление старых бэкапов (Политика хранения) ---
echo "[$(date +%Y-%m-%d\ %H:%M:%S)] Очистка бэкапов старше $RETENTION_DAYS дней..."
# find ищет файлы в BACKUP_DIR с именем, содержащим BACKUP_NAME, старше RETENTION_DAYS дней и удаляет их
find "$BACKUP_DIR" -name "${BACKUP_NAME}*.tar.gz" -type f -mtime +$RETENTION_DAYS -delete -print

echo "[$(date +%Y-%m-%d\ %H:%M:%S)] Процесс завершен."