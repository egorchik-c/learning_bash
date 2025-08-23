#!/bin/bash

read -p "Write dir to zip: " name

# ----Измените под себя----
SOURCE="$HOME/$name"
DIST="$HOME/code/learning_bash/scripts/backup_dir"

echo "DEBUG: Source: $SOURCE"
echo "DEBUG: Destination: $DIST"

# ----Основная логика скрипта----
if [[ ! -d "$SOURCE" ]]; then
    echo "ERROR: '$SOURCE' does not exist!"
    exit 1
fi

if [[ ! -d "$DIST" ]]; then
    mkdir -p "$DIST"
    echo "Created directory: $DIST"
fi

safe_name=$(echo "$name" | sed 's/[\/\\:*?"<>|]/_/g')
timestamp=$(date +%Y-%m-%d_%H-%M-%S)
archive_name="backup_${safe_name}_${timestamp}.tar.gz"
archive_path="$DIST/$archive_name"

echo "Creating archive: $archive_path"
tar -czf "$archive_path" -C "$(dirname "$SOURCE")" "$(basename "$SOURCE")"

if [[ $? -eq 0 ]]; then
    echo "Backup completed successfully: $archive_path"
    echo "Archive size: $(du -h "$archive_path" | cut -f1)"
else
    echo "ERROR: Backup failed!"
    exit 1
fi