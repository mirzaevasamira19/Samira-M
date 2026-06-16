# SteamStoreDB

## Описание проекта

Проект представляет собой базу данных для магазина цифровых игр типа Steam.  
База данных хранит информацию об играх, разработчиках, жанрах, пользователях, библиотеках игр и отзывах пользователей.

## Тема

**Магазин цифровых игр**

Основные сущности:

- пользователи;
- игры;
- разработчики;
- жанры;
- библиотеки игр;
- отзывы.

## ER-схема базы данных

Таблицы базы данных:


Developers(developer_id PK, name, country, website)

Users(user_id PK, username, email, password, registration_date)

Games(game_id PK, title, description, release_date, price, developer_id FK)

Genres(genre_id PK, genre_name)

Game_Genres(game_id FK, genre_id FK)

Libraries(library_id PK, user_id FK, game_id FK, purchase_date, playtime_hours)

Reviews(review_id PK, user_id FK, game_id FK, rating, review_text, review_date)


## Связи между таблицами


Developers 1 --- M Games

Games M --- M Genres через таблицу Game_Genres

Users M --- M Games через таблицу Libraries

Users 1 --- M Reviews

Games 1 --- M Reviews


## Описание таблиц

### Developers

Хранит информацию о разработчиках игр.

### Users

Хранит информацию о пользователях магазина.

### Games

Хранит информацию об играх, их цене, дате выхода и разработчике.

### Genres

Хранит список жанров игр.

### Game_Genres

Связующая таблица между играми и жанрами, так как одна игра может относиться к нескольким жанрам.

### Libraries

Хранит информацию о том, какие игры куплены пользователями.

### Reviews

Хранит отзывы и оценки пользователей на игры.

## SQL-скрипты

В репозитории находятся следующие файлы:

- create_tables.sql — создание таблиц базы данных;
- insert_data.sql — добавление тестовых данных;
- select_queries.sql — примеры SQL-запросов к базе данных.
- abc_analysis.sql — SQL-запрос для ABC-анализа продаж игр;
- ABC_ANALYSIS.md — отчет по результатам ABC-анализа.
- [ER Diagram](er_diagram.png)

## Примеры запросов

В файле select_queries.sql представлены запросы:

1. вывод всех игр с разработчиками;
2. вывод игр определенного жанра;
3. вывод библиотеки пользователя;
4. вывод отзывов к играм;
5. подсчет среднего рейтинга игр;
6. подсчет количества игр у каждого пользователя.

## Автор

Самира Мирзаева  
БИ2-24  
