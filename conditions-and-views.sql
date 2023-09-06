--- Знайти всі телефони, які купував юзер з id 11
-- Не використовуючи JOINів, за допомогою виразів підзапитів

-- варіант без JOIN'ів
SELECT * FROM products AS p
WHERE p.id = ANY (
    SELECT product_id FROM orders_to_products AS otp 
    WHERE otp.order_id = SOME (
        SELECT id FROM orders AS o
        WHERE customer_id = 11
    )
);


--варіант з JOIN'ами
SELECT * FROM products AS p
INNER JOIN orders_to_products AS otp
ON otp.product_id = p.id
INNER JOIN orders AS o
ON otp.order_id = o.id
WHERE o.customer_id = 11;