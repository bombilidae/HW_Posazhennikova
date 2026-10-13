
#!/bin/bash

# В папке создается папка house, в которой сразу  создается папка floor_1, и в ней также создаются комнаты  
mkdir -p house/floor_1/{kitchen,living_room,bathroom}
# Далее в папке house создается папка со вторым этажом и комнаты на нем
mkdir -p house/floor_2/{bedroom,balcony}
# Далее в папке bathroom создается папки-мебель
mkdir -p house/floor_1/bathroom/{shower,sink,mirror,toilet,bathroom_cabinet}
# После в папке bathroom_cabinet создаются файлы-предметы наполнение шкафа
touch house/floor_1/bathroom/bathroom_cabinet/{bath_towel,soap,shampoo}
# Аналогично в папке-кухня создаются папки-кухонная мебель
mkdir -p house/floor_1/kitchen/{fridge,cooker,oven,dishwasher,table,chairs,kitchen_unit}
# Дальше в папке-кухонном шкафу создаются файлы-посуда
touch house/floor_1/kitchen/kitchen_unit/{cup,plate,spoon,pot,frying_pan}
# В папке-гостиной создаются папки предметы и мебель
mkdir -p house/floor_1/living_room/{bookshelf,media_console,rug,sofa,coffee_table}
# В папке книжном шкафу создаются файлы-книги
touch house/floor_1/living_room/bookshelf/{magazines,books,photo_album}
# В файле shampoo записывается текст-наполнение шампуня
echo 'bubbles' > ./house/floor_1/bathroom/bathroom_cabinet/shampoo
# В файле photo_album записывается текст-наполнение фото альбома
echo 'Vacation photos' > ./house/floor_1/living_room/bookshelf/photo_album 
# В папке floor_2, в папке bedroom создаются файлы-мебель в спальне
mkdir -p house/floor_2/bedroom/{bed,night_stand,lamp,wardrobe}
# В папке balcony создаются папки-садовая мебель
mkdir -p house/floor_2/balcony/{garden_table,garden_chair}
# создается файл flowers в папке garden_table
touch house/floor_2/balcony/garden_table/flowers
# В файле flowers записывается текст-название цветка
echo 'hydrangea' > ./house/floor_2/balcony/garden_table/flowers
# В папке wardrobe записываются файлы dress,jeans,skirt
touch house/floor_2/bedroom/wardrobe/{dress,jeans,skirt}
# В папке night_stand записываются файл cup_of_water
touch house/floor_2/bedroom/night_stand/cup_of_water
