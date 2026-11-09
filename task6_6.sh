#!/bin/bash

# Заменить ; на , и склеить разорванную строку
sed 's/;/,/g' data.csv | sed 's/"New York$/"New York"/' > fixed.csv

# Проверка числа полей
echo "=== Все строки с числом полей ==="
awk -F',' '{ print NR": полей="NF" — "$0 }' fixed.csv
echo "=== Строки, где полей не 3 ==="
awk -F',' 'NR>1 && NF != 3 { print "ОШИБКА: "$0 }' fixed.csv

# Подзадача 3: сформировать предложение для каждой записи
tail -n +2 fixed.csv | while IFS=',' read -r name age city; do
    name=$(echo "$name" | tr -d '"')
    city=$(echo "$city" | tr -d '"')
    echo "Hello, my name is $name. I am $age years old and I live in $city."
done
