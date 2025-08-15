- REGEXP_LIKE — проверяет, соответствует ли строка заданному шаблону.
- REGEXP_REPLACE — заменяет часть строки, соответствующую шаблону.
- REGEXP_SUBSTR — извлекает подстроку по шаблону.
- REGEXP_INSTR — находит позицию вхождения шаблона.
- REGEXP_COUNT — считает количество вхождений шаблона.
- SIMMILAR TO  — проверяет, соответствует ли строка определённому шаблону.

## _SQL Регулярные выражения и операторы (PostgreSQL)_

1. REGEXP_LIKE — проверка соответствия
- Задача: найти профессии, в названии которых встречается слово "Engineer".    
  
| REGEXP_LIKE                                            |
|-------------------------------------------------------|
| SELECT *                                              |
| FROM salaries                                         |
| WHERE REGEXP_LIKE(job_title, 'Engineer');             |


2. REGEXP_REPLACE — замена по шаблону
- Задача: убрать слово "Senior" из названия должности.  

| REGEXP_REPLACE                                                  |
|-------------------------------------------------------------|
| SELECT job_title,                                           |
|  REGEXP_REPLACE(job_title, 'Scientist', '') AS cleaned_title|
|  FROM salaries;                                             |

 
3. REGEXP_SUBSTR — извлечение подстроки
- Задача: вытащить только год из work_year (если бы он был в формате YYYY-MM-DD).  

| REGEXP_SUBSTR                                                     |
|------------------------------------------------------------------|
| SELECT work_year,                                                |
| ~~REGEXP_SUBSTR(work_year, '^[0-9]{4}') AS year_only~~           |
| REGEXP_SUBSTR(CAST(work_year AS TEXT), '^[0-9]{4}') AS year_only |
| FROM salaries;                                                   |  


> regexp_substr работает только с текстом (string / varchar)   
> А work_year  — целое число (integer), и PostgreSQL не может автоматически преобразовать.  
> **Поэтому добавляем Cast**  


4. REGEXP_INSTR — найти позицию совпадения    
- Задача: узнать, на какой позиции встречается слово "Manager" в должности.
 
| REGEXP_INSTR                                    |
|------------------------------------------------|
| SELECT distinct job_title,                     |
| REGEXP_INSTR(job_title, 'Manager') AS position |
| FROM salaries;                                 |    

5. REGEXP_COUNT — количество совпадений
- Задача: сколько раз в названии должности встречается буква "e" (без учёта регистра).
  
| REGEXP_COUNT                                   |
|------------------------------------------------|
| SELECT job_title,                              |
| REGEXP_COUNT(LOWER(job_title), 'e') AS e_count |
| FROM salaries;                                 |  

6. SIMILAR TO — упрощённая проверка шаблона
- Задача: найти все должности, начинающиеся на "Data" или "Machine".
  
| REGEXP_COUNT                                   |
|------------------------------------------------|
| SELECT *                                       |
| FROM salaries                                  |
| WHERE job_title SIMILAR TO '(Data|Machine)%';  |  
