--- Порахувати кількість товару, ціна якого > 3000

SELECT count(id) FROM products
WHERE price > 3000;

------

SELECT sum(
    CASE
        WHEN price > 3000 THEN 1
    END
) FROM products;


------COEALESCE

SELECT COALESCE(NULL, 12, 24) --- 12
SELECT COALESCE(NULL, NULL, NULL) -- NULL

UPDATE products
SET description = 'Супер теелфон з довгим описом'
WHERE id BETWEEN 217 and 228;

-- Якщо опис телефону є - виводимо цей опис
-- Якщо опису немає, то виводимо - "про цей товар нічого не відомо"

SELECT id, brand, model, price, COALESCE(description, 'Про цей товар нічого невідомо')
FROM products;



------NULLIF

SELECT NULLIF(NULL, NULL); --- NULL
SELECT NULLIF(12, 12); --- NULL
SELECT NULLIF(12, NULL); --- 12
SELECT NULLIF(NULL, 12); --- NULL


-----GREATEST , LEAST

-- GREATEST - найбільше зі списку аргументів
-- LEAST - найменше зі списку аргументів

SELECT GREATEST(5, 8, 2); -- 8
SELECT LEAST(5, 8, 2); -- 2

-- Задача: вивести всі товари
-- якщо є знижка у товару (discounted_price) - виводимо саме знижку
-- якщо знижки немає, виводимо звичайний price

SELECT id, brand, model, LEAST(price, discounted_price)
FROM products;