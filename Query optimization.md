<img width="1294" height="330" alt="image" src="https://github.com/user-attachments/assets/71c7c157-b5cc-4a20-b38a-4bf3c4af6190" />  
<img width="1111" height="728" alt="image" src="https://github.com/user-attachments/assets/486c8fd7-2643-4385-a824-8e550ab54a6d" />  
<img width="1098" height="731" alt="image" src="https://github.com/user-attachments/assets/575b52d2-edfd-448e-b6b5-95f1c84f5a0e" />  

# Индексация

1️⃣ B-Tree (по умолчанию)
💡 Хорош для =, <, >, BETWEEN, сортировки.  
  > - Индекс для поиска по возрасту   
  > _CREATE INDEX idx_customer_age ON customer(age);_   
  > - Использование  
  > _SELECT * FROM customer WHERE age BETWEEN 20 AND 30;_    

2️⃣ Hash Index
💡 Быстрый поиск по точному равенству (=), но только для =.      
> - Индекс для поиска по имени  
> _CREATE INDEX idx_customer_name_hash ON customer USING hash(name);_    
> - Использование:  
> _SELECT * FROM customer WHERE name = 'Danya';_    
  
```
> ⚠️ Обычно B-Tree почти всегда быстрее и универсальнее, но Hash иногда чуть быстрее на огромных данных с только =.
```
3️⃣ GIN (Generalized Inverted Index)
💡 Для полнотекстового поиска, JSONB, массивов.

4️⃣ BRIN (Block Range Index)
💡 Эффективен для очень больших таблиц с последовательными значениями (например, по дате).  

- Пример: у нас есть колонка tags типа text[]  
> CREATE TABLE product (  
>    id SERIAL PRIMARY KEY,  
>   name TEXT,  
>    tags TEXT[] );  
  
- GIN индекс по массиву  
> CREATE INDEX idx_product_tags ON product USING gin(tags);  

> SELECT * FROM product WHERE tags @> ARRAY['electronics']  
