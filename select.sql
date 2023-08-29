-- Знайти кількість однорічок (кількість юзерів з однаковою кількістю років)

SELECT first_name, last_name, birthday, extract("years" from age(birthday)) AS age
FROM users
ORDER BY age;

-- залишити тільки ті групи, в яких міститься більше 6-ти однорічок

SELECT extract("years" from age(birthday)) AS "вікова_група", count(*) AS "кількість_користувачів_у_групі"
FROM users
GROUP BY "вікова_група"
HAVING count(*) >= 6
ORDER BY "вікова_група";

-- Витягти всі бренди, у яких кількість телефонів > 2300

SELECT brand, sum(quantity)
FROM products
GROUP BY brand
HAVING sum(quantity) > 2300;

-- Витягти всі телефони, яких було продано більше 50

SELECT product_id, sum(quantity)
FROM orders_to_products
GROUP BY product_id
HAVING sum(quantity) > 50;