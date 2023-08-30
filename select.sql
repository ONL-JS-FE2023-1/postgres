-- Знайти всіх юзерів, які нічого не замовляли (JOIN)

-- version 1
SELECT * FROM
users AS u LEFT JOIN orders AS o
ON u.id = o.customer_id
WHERE o.customer_id IS NULL;


-- version 2
SELECT * FROM users
WHERE id IN (
  SELECT id FROM users
  EXCEPT
  SELECT customer_id FROM orders
);