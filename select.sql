


-- Знайти всіх користувачів, від 20 до 40 років
SELECT first_name, last_name, birthday, extract("years" from age(birthday)) FROM users
WHERE extract("years" from age(birthday)) BETWEEN 20 AND 40;

-- Перейменувати extract на age
SELECT first_name, last_name, birthday, extract("years" from age(birthday)) AS age FROM users
WHERE extract("years" from age(birthday)) BETWEEN 20 AND 40;

-- Аліас - псевдонім -- AS

SELECT first_name AS "Ім'я",
last_name AS "Прзівище",
id AS "Особистий номер"
FROM users; 


-- Аліаси для таблиць

SELECT * FROM orders AS "Чек";
