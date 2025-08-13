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

CALL customer_insert(1, 'Danya', 25, 'Male');


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

SELECT * FROM customer_select_all();

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

CALL customer_update(1, 'DanyaPro', 26, 'Male');

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

CALL customer_delete(1);
