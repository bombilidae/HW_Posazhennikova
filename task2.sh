#!/bin/bash

# Скрипт создает резервные копии txt-файлов и переименовывает их с добавлением даты

Date=$(date +%Y-%m-%d)

for file in *.txt; do
  if [[ -f "$file" ]]; then
  new_name=$(echo "$file" | sed 's/\.txt$/_backup_'"$Date"'.txt/')
  cp "$file" "$new_name"
  echo "Создана резервная копия файла: $file, имя копии: %new_name"
  fi
done
