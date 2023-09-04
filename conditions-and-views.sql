/* Вивести юзерів, в яких в полі "стать" буде українською написано "жінка"
або "чоловік" або "інше значення" */


SELECT *, (
    CASE gender
        WHEN 'female' THEN 'жінка'
        WHEN 'male' THEN 'чоловік'
        ELSE 'інше значення'
    END
) AS "стать"
FROM users;


/*
Вивести на основі кількості років користувача, що він повнолітній або неповнолітній
*/

SELECT *, (
    CASE
        WHEN ( extract(year from age(birthday)) ) < 18 THEN 'неповнолітній'
        WHEN ( extract(year from age(birthday)) ) >= 18 THEN 'повнолітній'
        ELSE 'невідомо'
    END
)
FROM users;


/*


Вивести всі телефони (з таблиці products),
якщо ціна телефону > 6 тис - "флагман",
якщо ціна від 2 до 6 - "середній клас",
якщо ціна <2 тис - "бюджетний"

*/

SELECT *, (
    CASE
        WHEN price > 6000 THEN 'Флагман'
        WHEN price BETWEEN 2000 AND 6000 THEN 'Середній клас'
        WHEN price < 2000 THEN 'Бюджетний'
        ELSE 'Невідомо'
    END
) AS "статус_товара"
FROM products;


/*

Вивести користувачів з інформацією про їхні замовлення у вигляді:
- якщо більше >=3 - "постійний клієнт"
- якщо від 1 до 2 - "активний клієнт"
- якщо 0 замовлень - "новий клієнт"
*/

SELECT u.id, u.email, (
    CASE
        WHEN count(o.id) >= 3 THEN 'Постійний клієнт'
        WHEN count(o.id) BETWEEN 1 AND 2 THEN 'Активний клієнт'
        WHEN count(o.id) = 0 THEN 'Новий клієнт'
    END
) FROM
users AS u JOIN orders AS o
ON u.id = o.customer_id
GROUP BY u.id, u.email;

----------

INSERT INTO users (
    first_name,
    last_name,
    email,
    gender,
    is_subscribe,
    birthday
  )
VALUES (
    'Iron',
    'Man',
    'tonymail@gmail.com',
    'male',
    true,
    '1975-08-09'
);


SELECT u.id, u.email, (
    CASE
        WHEN count(o.id) >= 3 THEN 'Постійний клієнт'
        WHEN count(o.id) BETWEEN 1 AND 2 THEN 'Активний клієнт'
        WHEN count(o.id) = 0 THEN 'Новий клієнт'
    END
) FROM
users AS u LEFT JOIN orders AS o
ON u.id = o.customer_id
GROUP BY u.id, u.email
ORDER BY count(o.id);