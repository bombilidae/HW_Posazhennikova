#!/bin/bash

# Скрипт проверяет существует ли файл и указывает мягкую ссылку на него

file="$1"

# Проверка существует ли файл
if [[ ! -e  "$file" ]]; then
  echo "Ошибка! Файла не существует."
  exit 1
#Создание мягкой ссылки с использованием имени файла
else
  link="$(basename "$file")"
  absolute_path="$(realpath "$file")"
  ln -s "$absolute_path" "$link"
  echo "Создана мягкая ссылка: $link"
fi
