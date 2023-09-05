--- Знайти всі телефони, які купував юзер з id 23
-- Не використовуючи JOINів, за допомогою виразів підзапитів
-- Завдання виконайте, створивши вьюху





---VIEWS
--Нам потрібні всі юзери. Нам потрібно знати,скільки кожен юзер зробив замовлень

/*

CREATE VIEW name AS (
    query....
)

*/

CREATE OR REPLACE VIEW users_with_orders_amount AS (
    SELECT u.*, count(o.id) AS "orders_amount" FROM
    users AS u LEFT JOIN orders AS o
    ON u.id = o.customer_id
    GROUP BY u.id, u.email
    ORDER BY "orders_amount" ASC
);

DROP VIEW users_with_orders_amount;

SELECT * FROM users_with_orders_amount;

--Витягти всі email юзерів, які мають тільки 1 замовлення
SELECT email, orders_amount FROM users_with_orders_amount
WHERE orders_amount = 1;


--Створити представлення, яке зберігає замовлення з їхньою вартістю

CREATE VIEW orders_with_price AS (
    SELECT o.id AS "order_id", o.customer_id AS "customer_id", sum(p.price * otp.quantity) AS "order_sum", status FROM
    orders AS o INNER JOIN orders_to_products AS otp
    ON o.id = otp.order_id
    INNER JOIN products AS p
    ON p.id = otp.product_id
    GROUP BY o.id
);

--На основі вьюхи orders_with_price
--Вивести юзерів з сумою коштів, які вони витратили у нашому магазині

CREATE VIEW users_with_total_amounts AS (
    SELECT u.*, sum(owp.order_sum) AS "total_amount" FROM
    users AS u INNER JOIN orders_with_price AS owp
    ON u.id = owp.customer_id
    GROUP BY u.id
);


--Зробити топ-10 користувачів, які залишили найбільшу суму грошей у нашому магазині
SELECT * FROM users_with_total_amounts
ORDER BY total_amount DESC
LIMIT 10;