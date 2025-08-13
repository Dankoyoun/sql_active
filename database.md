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
