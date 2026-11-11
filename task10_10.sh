#!/bin/bash

# Создание директории backup
mkdir -p backup

# Создание 7 директорий и файла info.txt в каждой
for i in {1..7}; do
  mkdir -p backup/day_${i}
  echo "Резервная копия за день $i" > backup/day_${i}/info.txt
done

# Создание all_backups и копирование
mkdir -p all_backups
for i in {1..7}; do
  cp backup/day_${i}/info.txt all_backups/info_day_${i}.txt
done

# Вывод содержимого
ls all_backups/
