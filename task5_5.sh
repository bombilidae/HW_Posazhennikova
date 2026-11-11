#!/bin/bash

# Приводим текст к нижнему регистру
tr 'A-Z' 'a-z' < text.txt | sed 's/[.,!?;:'"'"'()]//g' > text_low.txt

# ТОП-5 самых часто встречающихся
cat text_low.txt | tr ' ' '\n' | grep -v '^$' | sort | 
 uniq -c | sort -nr | head -5 > top_words.txt 
cat top_words.txt

# Получене определений
awk '{print $2}' top_words.txt | while read word; do
    echo "=== $word ==="
    curl -s "https://api.dictionaryapi.dev/api/v2/entries/en/$word"
    echo
done
