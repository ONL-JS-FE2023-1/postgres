DROP TABLE orders;

CREATE TABLE orders(
    id serial PRIMARY KEY,
    created_at timestamp NOT NULL DEFAULT current_timestamp,
    customer_id int REFERENCES users(id) -- зовнішній ключ (foreign key)
);

ALTER TABLE users
ADD COLUMN id serial PRIMARY KEY;


-- таблиця1_to_таблиця2
CREATE TABLE orders_to_products(
    order_id int REFERENCES orders(id),
    product_id int REFERENCES products(id),
    quantity int,
    PRIMARY KEY(order_id, product_id)
);

-- Оформлення замовлення для Джона Доу
INSERT INTO orders (customer_id) VALUES(1);

INSERT INTO orders_to_products (order_id, product_id, quantity) VALUES
(1, 4, 2),
(1, 2, 1),
(1, 1, 1);
