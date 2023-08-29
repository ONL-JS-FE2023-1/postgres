-- 1. Відсортувати юзерів за віком (кількістю повних років)
-- 2. Відсортуйте телефони за ціною, від найдорожчого до найдешевшого
-- 3. Виведіть топ-5 телефонів, які частіше за все купують (більше за все продано)

--1
--VERSION 1
SELECT first_name, last_name, birthday, extract("years" from age(birthday)) AS age
FROM users
ORDER BY age ASC;

--VERSION 2
SELECT * FROM (
    SELECT first_name, last_name, birthday, extract("years" from age(birthday)) AS age
    FROM users
) AS "users_with_age"
ORDER BY "users_with_age".age ASC;


--2
SELECT *
FROM products
ORDER BY price DESC;

--3
SELECT product_id, sum(quantity) AS "кількість_продажів"
FROM orders_to_products
GROUP BY product_id
ORDER BY "кількість_продажів" DESC
LIMIT 5;