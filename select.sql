CREATE TABLE A(
    v char(3),
    t int
);

CREATE TABLE B(
    v char(3)
);

INSERT INTO A VALUES
('XXX', 1),
('XXY', 1),
('XXZ', 1),
('XYX', 2),
('XYY', 2),
('XYZ', 2),
('YXX', 3),
('YXY', 3),
('YXZ', 3);

INSERT INTO B VALUES
('ZXX'), ('XXX'), ('ZXZ'), ('YXZ'), ('YXY'); 

-- UNION - об'єднання
-- (все те, що в множині А + все те, що в множині B, значення, які повторюються - в 1 єкземплярі)

-- INTERSECT (перетин)
-- (все те, що є і в A і в B в одному єкземплярі)

-- Різниця (EXCEPT):
--      A мінус B: все з А мінус спільні елементи для А і B
--      B мінус A: все з B мінус спільні елементи для A і B




------
SELECT * FROM a, b
WHERE A.v = B.v;


-----
SELECT * FROM
A JOIN B
ON A.v = B.v;


-- Знайти всі замовлення юзера, у якого id = 5
SELECT u.id AS "user_id", u.first_name, u.last_name, u.email, o.id AS "order_id", o.created_at FROM users AS u
JOIN orders AS o
ON o.customer_id = u.id
WHERE u.id = 5;

--
SELECT * FROM
A JOIN B ON A.v = B.v JOIN products ON A.t = products.id;


-- Знайти id всіх замовлень у чеку, де були замовлені телефони бренду Huawei
SELECT * FROM
products JOIN orders_to_products
ON products.id = orders_to_products.product_id
WHERE products.brand = 'Huawei';

-- Порахувати скільки замовлень бренду Huawei всього було
SELECT count(*) FROM
products JOIN orders_to_products
ON products.id = orders_to_products.product_id
WHERE products.brand = 'Huawei';


-- Зробити топ продажів, який бренд частіше за всіх купували
SELECT p.brand, count(*) AS "quantity" FROM
products AS p JOIN orders_to_products AS otp
ON p.id = otp.product_id
GROUP BY p.brand
ORDER BY "quantity" DESC;