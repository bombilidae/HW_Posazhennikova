#!/bin/bash

# Проверяет файл и поддерживается ли название организма (human, mouse, rat, fly)

file_name="$1"
organism_name="$2"

# Проверка существует ли файл
if [[ ! -e  "$file_name" ]]; then
  echo "Ошибка! Файл $file_name не существует!"
  exit 1
fi
 
# Проверяем подходит ли аргумент с именем по условию
case "$organism_name" in
  human|mouse|rat|fly) 
  file_name="$(basename "$file_name")"
  echo "Обрабатываю  $file_name"
  ;;
*)
  echo "Ошибка! Организм $organism_name не поддерживается!"
  echo "Поддерживаемые скриптом организмы: human, mouse, rat, fly."
  exit 1
  ;;
esac
  

