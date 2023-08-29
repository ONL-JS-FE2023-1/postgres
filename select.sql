/*

1. Порахувати кількість товарів, які були продані (sum(quantity) -> orders_to_products)
2. Кількість товарів, які є на складі (sum(quantity) -> products)
3. Середня ціна всіх товарів
4. Середня ціна кожного бренду
5. Сума вартості всіх телефонів, які коштують в діапазоні від 1к до 2к
6. Кількість моделей кожного бренду
7**. Кількість замовлень кожного користувача, який робив замовлення (групуємо по customer_id в таблиці orders -> count)
8. Середня ціна телефону Huawei (якщо немає Huawei - порахуйте середню ціну якогось бренду, який є)


*/

-- 1
SELECT sum(quantity)
FROM orders_to_products;

-- 2
SELECT sum(quantity)
FROM products;

-- 3
SELECT avg(price)
FROM products;

-- 4
SELECT brand, avg(price)
FROM products
GROUP BY brand;

-- 5
SELECT sum(quantity * price)
FROM products
WHERE price BETWEEN 1000 AND 2000;

-- 6
SELECT brand, count(*) -- id = *
FROM products
GROUP BY brand;

-- 7
SELECT customer_id, count(*)
FROM orders
GROUP BY customer_id;

-- 8
SELECT avg(price)
FROM products
WHERE brand = 'Huawei';