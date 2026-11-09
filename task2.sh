#!/bin/bash

# Общая стоимость по категориям (Price * Stock)
awk -F',' 'NR>1 {cost[$3] += $4 * $5}
END { for (category in cost) print category, cost[category] }' products.csv | sort -k2nr

# Удаление кончившихся товаров
sed '/,0$/d' products.csv > available_products.csv

# Вывод товаров с ценой выше 100
tail -n +2 available_products.csv | while IFS=',' read -r id name category price stock; do
awk -v p="$price" -v n="$name" 'BEGIN { if (p>100) print n }'
