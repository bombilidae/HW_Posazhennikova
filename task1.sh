#!/bin/bash

# Извлечение IP-адреса и кодов состояния
awk '{print $1, $9}' access.log > status_codes.txt

# Поиск и замена строк с 4** на CLIENT_ERROR
grep '" 4[0-9][0-9] ' access.log | sed 's/" 4[0-9][0-9] /" CLIENT_ERROR /' > errors.log

# для каждого уникального IP-адреса из файла status_codes.txt подсчитывает количество запросов 
for ip in $(awk '{print $1}' status_codes.txt | sort -u); do
  count=$(grep "$ip" status_codes.txt | wc -l)
  echo "IP-адрес: $ip, запросов: $count"
done
