#!/bin/bash

# Проверка является ли расширение файла - FASTA

file_path=$1

#Проверяем, что путь существует
if [[ ! -e "$file_path" ]]; then
  echo "Ошибка! Путь $file_path"
  exit 1
fi

# Прверяем, что это обычный файл, а не папка
if [[ ! -f "$file_path" ]]; then
  echo "Ошибка! Файл $file_path не является обычным!"
  exit 1
fi 

# Берем первую строчку из файла, так как FASTA от FASTQ можно отличить по началу первой строки
first_line=$(head -n 1 "$file_path")

# Проверяем начинается ли строка с символа ">" - тогда это FASTA
if [[ "$first_line" == ">"* ]]; then
  echo "Файл является FASTA."
else
  echo "Ошибка! Файл не является FASTA"
  exit 1
fi
