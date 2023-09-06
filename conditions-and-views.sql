/* ENUM */

---order status:
-- true - виконано
-- false - не виконано

SELECT * FROM orders
WHERE status = true;


--- 'processing' --- 'prosesing' --- '...' --- '...'

---new
---processing
---shiped
---done


CREATE TYPE order_status AS ENUM('new', 'processing', 'shiped', 'done');

---

ALTER TABLE orders
ALTER COLUMN status
TYPE order_status
USING(
    CASE status
        WHEN false THEN 'processing'
        WHEN true THEN 'done'
        ELSE 'new'
    END
)::order_status;


----
DROP VIEW orders_with_price, users_with_orders_amount, users_with_total_amounts;

----

INSERT INTO orders (customer_id, status)
VALUES (
    90,
    'new'
);


------
UPDATE orders
SET status = 'shiped'
WHERE id = 6;