#!/bin/bash

# Создание файлов
for i in {1..5}; do
  touch "document${i}.txt"
done

# Создание директории
mkdir -p renamed

# Чтение списка документов, сздание нового имени и перенос в новую директорию 
ls document*.txt | while read file; do
  new_name=$(echo "$file" | sed 's/document/file/g') 
  mv "$file" "renamed/$new_name"
done

# Вывод списка в renamed
ls renamed/
