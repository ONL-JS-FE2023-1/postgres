-- ORDER BY - сортує дані в таблиці за якимсь стовпцем
-- ORDER BY може приймати стовпець таблиці, за яким потрібно проводити сортування
-- Крім того, може приймати 2 налаштування:
-- ASC - за збільшенням (за замовчуванням)
-- DESC - за зменшенням

SELECT concat(first_name, ' ', last_name) AS "full name" FROM users
ORDER BY "full name" DESC;

--

SELECT * FROM users
WHERE birthday IS NOT NULL
ORDER BY birthday DESC,
            first_name DESC;

-- Задача: дізнатись, яких товарів у нас залишилось менше всіх

SELECT *
FROM products
ORDER BY quantity ASC;

-- Задача: вивести топ-5 телефонів, яких в нас залишилось найменше
SELECT *
FROM products
ORDER BY quantity ASC
LIMIT 5;