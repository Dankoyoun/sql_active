1.  INSERT

-- Процедура для добавления нового клиента
CREATE PROCEDURE customer_insert(
    p_customerid INT,       -- ID клиента
    p_name VARCHAR(50),     -- Имя клиента
    p_age INT,              -- Возраст клиента
    p_gender VARCHAR(10)    -- Пол клиента
)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO customer (customerid, name, age, gender)
    VALUES (p_customerid, p_name, p_age, p_gender);
END;
$$;
________________________________________________
CALL customer_insert(1, 'Danya', 25, 'Male');
________________________________________________

2. SELECT (через функцию, т.к. процедуры не возвращают данные напрямую)

-- Функция для получения всех клиентов
CREATE FUNCTION customer_select_all()
RETURNS TABLE (
    customerid INT,  -- ID клиента
    name VARCHAR,    -- Имя клиента
    age INT,         -- Возраст клиента
    gender VARCHAR   -- Пол клиента
)
LANGUAGE sql
AS $$
    SELECT customerid, name, age, gender
    FROM customer;
$$;
________________________________________________
SELECT * FROM customer_select_all();
________________________________________________
3. UPDATE

-- Процедура для обновления данных клиента
CREATE PROCEDURE customer_update(
    p_customerid INT,       -- ID клиента
    p_name VARCHAR(50),     -- Новое имя
    p_age INT,              -- Новый возраст
    p_gender VARCHAR(10)    -- Новый пол
)
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE customer
    SET name = p_name,
        age = p_age,
        gender = p_gender
    WHERE customerid = p_customerid;  -- Обновляем только одного клиента по ID
END;
$$;
________________________________________________
CALL customer_update(1, 'DanyaPro', 26, 'Male');
________________________________________________
4. DELETE

-- Процедура для удаления клиента по ID
CREATE PROCEDURE customer_delete(
    p_customerid INT    -- ID клиента, которого нужно удалить
)
LANGUAGE plpgsql
AS $$
BEGIN
    DELETE FROM customer
    WHERE customerid = p_customerid;  -- Удаляем только одного клиента по ID
END;
$$;
________________________________________________
CALL customer_delete(1);
________________________________________________
5. UPSERT
    
CREATE PROCEDURE customer_upsert(
    p_customerid INT,
    p_name VARCHAR(50),
    p_age INT,
    p_gender VARCHAR(10)
)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO customer (customerid, name, age, gender)
    VALUES (p_customerid, p_name, p_age, p_gender)
    ON CONFLICT (customerid) DO UPDATE
    SET name = EXCLUDED.name,
        age = EXCLUDED.age,
        gender = EXCLUDED.gender;
END;
$$;
_________________________________________________
-- Добавление нового клиента
CALL customer_upsert(1, 'Danya', 25, 'Male');

-- Обновление клиента с тем же ID
CALL customer_upsert(1, 'DanyaPro', 26, 'Male');
__________________________________________________
