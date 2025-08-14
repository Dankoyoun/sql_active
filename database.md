| Команда / Концепция | Описание | Пример |
|--------------------|----------|--------|
| SQL Database | Создание или управление базой данных | `CREATE DATABASE mydb;` |
| SQL Create DB | Создание базы данных | `CREATE DATABASE shop;` |
| SQL Drop DB | Удаление базы данных (все данные будут удалены) | `DROP DATABASE shop;` |
| SQL Backup DB | Резервное копирование базы данных | `pg_dump mydb > backup.sql` |
| SQL Create Table | Создание таблицы | `CREATE TABLE customer (id INT PRIMARY KEY, name VARCHAR(50));` |
| SQL Drop Table | Удаление таблицы | `DROP TABLE customer;` |
| SQL Alter Table | Изменение структуры таблицы | `ALTER TABLE customer ADD email VARCHAR(100);` |
| SQL Constraints | Ограничения на значения столбцов | `NOT NULL, UNIQUE, PRIMARY KEY, FOREIGN KEY, CHECK, DEFAULT` |
| SQL Not Null | Запрещает пустые значения | `name VARCHAR(50) NOT NULL` |
| SQL Unique | Гарантирует уникальные значения | `email VARCHAR(100) UNIQUE` |
| SQL Primary Key | Главный уникальный идентификатор строки | `id INT PRIMARY KEY` |
| SQL Foreign Key | Связь между таблицами | `FOREIGN KEY (customer_id) REFERENCES customer(id)` |
| SQL Check | Ограничение на допустимые значения | `age INT CHECK (age >= 18)` |
| SQL Default | Значение по умолчанию | `status VARCHAR(20) DEFAULT 'active'` |
| SQL Index | Ускоряет поиск по столбцу | `CREATE INDEX idx_email ON customer(email);` |
| SQL Auto Increment | Автоматическая нумерация | `id SERIAL PRIMARY KEY` |
| SQL Dates | Работа с типами даты и времени | `order_date DATE DEFAULT CURRENT_DATE` |
| SQL Views | Виртуальная таблица, сохраняет запрос | `CREATE VIEW active_customers AS SELECT * FROM customer WHERE status='active';` |
| SQL Injection | Уязвимость, когда пользователь вводит вредный SQL-код | `' OR 1=1 --` |
| SQL Hosting | Размещение базы данных на сервере | `AWS RDS, Azure, Heroku, локальный сервер` |
| SQL Data Types | Типы данных: числа, текст, даты, логические значения | `price DECIMAL(10,2)` |  


| Команда / Концепция | Описание | Пример PostgreSQL |
|--------------------|----------|-----------------|
| SQL Database | Создание или управление базой данных | `CREATE DATABASE mydb;` |
| SQL Create DB | Создание базы данных | `CREATE DATABASE shop;` |
| SQL Drop DB | Удаление базы данных | `DROP DATABASE shop;` |
| SQL Backup DB | Резервное копирование базы данных | `pg_dump mydb > backup.sql` |
| SQL Create Table | Создание таблицы | `CREATE TABLE customer (id SERIAL PRIMARY KEY, name VARCHAR(50));` |
| SQL Drop Table | Удаление таблицы | `DROP TABLE customer;` |
| SQL Alter Table | Изменение структуры таблицы | `ALTER TABLE customer ADD COLUMN email VARCHAR(100);` |
| SQL Constraints | Ограничения на значения столбцов | `NOT NULL, UNIQUE, PRIMARY KEY, FOREIGN KEY, CHECK, DEFAULT` |
| SQL Not Null | Запрещает пустые значения | `name VARCHAR(50) NOT NULL` |
| SQL Unique | Гарантирует уникальные значения | `email VARCHAR(100) UNIQUE` |
| SQL Primary Key | Главный уникальный идентификатор строки | `id SERIAL PRIMARY KEY` |
| SQL Foreign Key | Связь между таблицами | `FOREIGN KEY (customer_id) REFERENCES customer(id)` |
| SQL Check | Ограничение на допустимые значения | `age INT CHECK (age >= 18)` |
| SQL Default | Значение по умолчанию | `status VARCHAR(20) DEFAULT 'active'` |
| SQL Index | Ускоряет поиск по столбцу | `CREATE INDEX idx_email ON customer(email);` |
| SQL Auto Increment | Автоматическая нумерация | `id SERIAL PRIMARY KEY` |
| SQL Dates | Работа с типами даты и времени | `order_date DATE DEFAULT CURRENT_DATE` |
| SQL Views | Виртуальная таблица, сохраняет запрос | `CREATE VIEW active_customers AS SELECT * FROM customer WHERE status='active';` |
| SQL Functions / Procedures | Хранимые процедуры и функции | `CREATE FUNCTION get_customers() RETURNS TABLE(id INT, name VARCHAR) AS $$ SELECT id, name FROM customer; $$ LANGUAGE sql;` |
| SQL Injection | Уязвимость при вводе вредного кода | Использовать подготовленные выражения: `PREPARE stmt AS SELECT * FROM customer WHERE name=$1;` |
| SQL Hosting | Размещение PostgreSQL базы на сервере | `AWS RDS, Heroku Postgres, локальный сервер` |
| SQL Data Types | Типы данных: числа, текст, даты, логические значения | `INT, SERIAL, VARCHAR, TEXT, BOOLEAN, DATE, TIMESTAMP, DECIMAL(10,2)` |    

> В AlbumCopy появятся все альбомы AC/DC.      
> Данные взяты прямо из запроса SELECT.  

CREATE TABLE AlbumCopy (  
    AlbumId INTEGER,  
    Title TEXT,  
    ArtistId INTEGER  );  
Скопируем все альбомы группы AC/DC:  

INSERT INTO AlbumCopy (AlbumId, Title, ArtistId)  
SELECT AlbumId, Title, ArtistId  
FROM Album  
JOIN Artist ON Album.ArtistId = Artist.ArtistId   
WHERE Artist.Name = 'AC/DC';          

Select BillingAddress  , BillingCity  , BillingState     
FROM invoice  
ORDER BY  
(CASE  
	WHEN BillingState IS NOT NULL THEN BillingCity   
	ELSE BillingState  
END  
);  

