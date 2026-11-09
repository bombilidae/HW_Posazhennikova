#!/bin/bash

# Создание корневой директории
mkdir -p my_project

# Поддиректории
mkdir -p my_project/src my_project/docs my_project/tests my_project/build

# Подпапки images, scripts, data в каждой поддиректории
for folder in src docs tests build; do
    mkdir -p my_project/$folder/images my_project/$folder/scripts my_project/$folder/data
done

# Список созданных директорий
for dir in $(find my_project -type d | sort); do
    echo "Создана директория: $dir"
done

# Пустой README.md
touch my_project/README.md

# Структура проекта
echo "=== Структура проекта ==="
ls -R my_project
