#!/bin/bash

# Создание директории logs
mkdir -p logs

# Создание 10 файлов с именами
for file in {1..10}; do
  num=$(printf "%02d" $file)
  touch "logs/log_${num}.txt"
  echo "Это лог номер $file" > "logs/log_${num}.txt"
done

# Вывод всех файлов на экран
for f in logs/log_*.txt; do
  echo "=== $f ==="
  cat "$f"
done

# Удаление четных значений
for f in logs/log_*.txt; do
  name=$(basename "$f" .txt)
  name_cut=$(echo "$name" | sed 's/log_//')
  num=$((10#$name_cut))
  if (( num % 2 == 0 )); then
     rm "$f"
  fi
done

