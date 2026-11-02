#!/bin/bash
# Скрипт проверяет формат файла CSV/TSV и проверяет его корректность 

file_name="$1"

# проверка, что файл существует
if [[ ! -f  "$file_name" ]]; then
  echo "Ошибка! Файл не найден!"
  exit 1
fi

# Определим формат файла 
first_string=$(head -n 1 "$file_name")
commas=$(echo "$first_string" | grep -o ',' | wc -l)
tabs=$(echo "$first_string" | grep -o $'\t' | wc -l)
if [[ "$commas" -gt "$tabs" ]]; then
  separate=','
  format="CSV"
else
 separate=$'\t'
 format="TSV"
fi
echo "Формат файла - $format"

# Проверка, что количество столбцов в каждой строке 
awk -v sep="$separate" '
  BEGIN { FS=sep; errors=0 }
  NR==1 { etalon=NF }
  NR>1 && NF!=etalon {print "В строке номер " NR " " NF " столбцов вместо " etalon 
  errors++
  }
  END { if(errors==0) print "Ok";
  else print "failed with " errors " errors"}
' "$file_name"
