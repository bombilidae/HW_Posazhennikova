#!/bin/bash

# Создание файлов
touch image1.jpg image2.png doc1.txt doc2.pdf script.sh archive.tar.gz

# Создание директорий images, documents, scripts, archives
mkdir -p images documents scripts archives

# Определение расширения файла и их сортировка
for i in *; do
  if [ -d "$i" ]; then
     continue
  fi
  if [ "$i" = "task11.sh" ]; then
     continue
  fi
  case "$i" in
  *.jpg | *.png) mv "$i" images/ ;; 
  *.pdf | *.txt) mv "$i" documents/ ;;
  *.sh) mv "$i" scripts/ ;;
  *.tar.gz) mv "$i" archives/ ;;
  *) echo "Неизвестный файл $i" ;;
  esac
done

# Вывод структуры
ls -R

