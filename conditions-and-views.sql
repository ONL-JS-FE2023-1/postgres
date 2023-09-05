--- Знайти всі телефони, які купував юзер з id 23
-- Не використовуючи JOINів, за допомогою виразів підзапитів





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