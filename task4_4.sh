#!/bin/bash

# Преобразование ключ-значение
sed 's/[{}"]//g; s/ //g; s/,/\n/g; s/:/=/g' config.json > config.txt

# Добавление префикса CONF
awk '{print "CONF_" $0}' config.txt > config_fin.txt

# Экспорт каждой строки как переменной среды
for line in $(cat config_fin.txt); do
   export "$line"
   echo "Экспорт выполнен $line"
done
