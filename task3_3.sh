#!/bin/bash

# Оставляем столбцы Filesystem и Use% и скрыв заголовок
df -h | awk 'NR>1 {print $1, $5}' > format.txt

# Удаление % и замена dev на device
sed 's/%//g; s/dev/device/g' format.txt > changed.txt

# Предупреждение файловой системы при использовании больше 80%
IFS=$'\n'
for line in $(cat changed.txt); do
  echo "$line" | awk '$2+0 > 80 {print "WARNING! Файловая система " $1 " заполнена " $2 "%" }'
done
