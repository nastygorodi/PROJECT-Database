# PROJECT-Database

Предметной областью базы данных являются музыкальные исполнители.


Все имеющиеся популярные ресурсы, например, стриминговые площадки ( spotify или apple music, где в основном информация лишь про треки ) или википедия, странички которой может модифицировать любой пользователь, собирают информацию лишь частично. Поэтому было принято решение создать базу данных, которая бы собрала в единое целое разнообразную информацию и позволила бы делать запросы для получения данных, которые невозможно также быстро и удобно получить ни на одном из имеющихся популярных ресурсов.

_Хранящиеся данные:_

* музыкальные исполнители
* лейблы звукозаписи
* треки
* награды и музыкальные премии
* видеоклипы
* музыкальные альбомы
* фильмография ( опционально )
* мировые туры

## Язык разработки

* SQL ( PostgreSQL )

## Концептуальная модель

<img width="1077" alt="image" src="https://user-images.githubusercontent.com/60066872/156719197-0c811fa0-5b59-43db-92f6-45987b96f2e4.png">

## Логическая модель

<img width="1099" alt="image" src="https://user-images.githubusercontent.com/60066872/156719288-0a9e2b07-5fc5-4bc5-98e8-78043f3c0469.png">

## Создание резервной копии базы данных

В терминале в папке с проектом вводится команда:

```pg_dump -O musicians > myDataBase.sql```

## Пример использования

В файле ```file_with_requests.sql``` находятся примеры запросов к базе данных.
