🔹 1. Работа с базами и схемами  
 • CREATE DATABASE имя;  
 • ALTER DATABASE имя ...;  
 • DROP DATABASE имя;  
 • CREATE SCHEMA имя;  
 • ALTER SCHEMA имя ...;  
 • DROP SCHEMA имя [CASCADE];  
 • SET search_path TO schema; (смена схемы)  

⸻

🔹 2. Таблицы  
 • CREATE TABLE имя (...);  
 • CREATE TABLE имя (LIKE другая_таблица INCLUDING ALL);  
 • ALTER TABLE имя ADD COLUMN ...;  
 • ALTER TABLE имя DROP COLUMN ...;  
 • ALTER TABLE имя RENAME TO ...;  
 • DROP TABLE имя [CASCADE];  
 • TRUNCATE TABLE имя; (очистить таблицу)  

⸻

🔹 3. Ограничения (constraints)  
 • PRIMARY KEY  
 • FOREIGN KEY  
 • UNIQUE  
 • CHECK  
 • NOT NULL  
 • DEFAULT  
  
⸻
  
🔹 4. Индексы  
 • CREATE INDEX idx_name ON table (column);  
 • CREATE UNIQUE INDEX ...;  
 • CREATE INDEX ... USING btree|hash|gin|gist;  
 • DROP INDEX имя;  
 • ALTER INDEX ... RENAME TO ...;  

⸻

🔹 5. Последовательности и автоинкремент  
 • CREATE SEQUENCE seq_name;  
 • ALTER SEQUENCE seq_name RESTART WITH n;  
 • DROP SEQUENCE seq_name;  
 • NEXTVAL('seq_name')  
 • CURRVAL('seq_name')  
 • SERIAL / BIGSERIAL (автоинкремент)  
 • GENERATED ALWAYS AS IDENTITY (современный автоинкремент)  
  
⸻

🔹 6. DML (работа с данными)  
 • SELECT ... FROM ...;  
 • INSERT INTO table (...) VALUES (...);  
 • UPDATE table SET col = val WHERE ...;  
 • DELETE FROM table WHERE ...;  
 • RETURNING (возврат значений при INSERT/UPDATE/DELETE)  
  
⸻

🔹 7. Транзакции  
 • BEGIN;  
 • COMMIT;  
 • ROLLBACK;  
 • SAVEPOINT имя;  
 • ROLLBACK TO SAVEPOINT имя;  
 • SET TRANSACTION ISOLATION LEVEL ...;  

⸻

🔹 8. Управление пользователями и доступами  
 • CREATE ROLE имя;  
 • CREATE USER имя WITH PASSWORD 'пароль';  
 • ALTER USER имя ...;  
 • DROP USER имя;  
 • GRANT SELECT, INSERT ON table TO user;  
 • REVOKE ALL PRIVILEGES ON table FROM user;  

⸻

🔹 9. JOIN (соединения)  
 • INNER JOIN  
 • LEFT JOIN  
 • RIGHT JOIN  
 • FULL OUTER JOIN  
 • CROSS JOIN  
 • NATURAL JOIN  
 • USING (col1, col2)  

⸻

🔹 10. Подзапросы и CTE  
 • SELECT ... WHERE col IN (SELECT ...);  
 • EXISTS (SELECT ...);  
 • WITH cte AS (SELECT ...) SELECT * FROM cte;  
 • WITH RECURSIVE tree AS (...) SELECT * FROM tree;  

⸻

🔹 11. Агрегаты и группировка  
 • COUNT(*)  
 • SUM(col)  
 • AVG(col)  
 • MIN(col)  
 • MAX(col)  
 • GROUP BY  
 • HAVING  

⸻

🔹 12. Оконные функции (window functions)  
 • ROW_NUMBER() OVER (PARTITION BY ... ORDER BY ...)  
 • RANK() / DENSE_RANK()  
 • NTILE(n)  
 • LAG(col, n) / LEAD(col, n)  
 • FIRST_VALUE() / LAST_VALUE()  
 • OVER (PARTITION BY ... ORDER BY ...)  

⸻

🔹 13. Модификаторы SELECT  
 • DISTINCT  
 • LIMIT n  
 • OFFSET n  
 • FETCH FIRST n ROWS ONLY  
 • ORDER BY col ASC|DESC  

⸻

🔹 14. Множества  
 • UNION / UNION ALL  
 • INTERSECT / INTERSECT ALL  
 • EXCEPT / EXCEPT ALL  

⸻

🔹 15. Типы данных (главные)  
 • Числовые: INTEGER, BIGINT, NUMERIC, DECIMAL, REAL, DOUBLE PRECISION, SERIAL  
 • Строки: CHAR(n), VARCHAR(n), TEXT  
 • Дата/время: DATE, TIME, TIMESTAMP, INTERVAL  
 • Логика: BOOLEAN  
 • Специальные: UUID, JSON, JSONB, ARRAY, BYTEA  

⸻

🔹 16. JSON и массивы  
 • ->, ->>, #> (операторы JSON/JSONB)  
 • jsonb_build_object(), jsonb_agg()  
 • ARRAY[...], unnest(array)  

⸻

🔹 17. Администрирование  
 • \l – список баз  
 • \c dbname – подключиться  
 • \dt – таблицы  
 • \d имя_таблицы – описание структуры  
 • \du – пользователи  
 • EXPLAIN / EXPLAIN ANALYZE – план запроса  

⸻

🔹 18. Триггеры и процедуры  
 • CREATE FUNCTION ... RETURNS trigger ...  
 • CREATE TRIGGER ... BEFORE|AFTER INSERT|UPDATE|DELETE ON table  
 • DROP TRIGGER имя;    
 • CALL procedure(...); 
