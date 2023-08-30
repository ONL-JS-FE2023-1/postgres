INSERT INTO products (
    brand,
    model,
    description,
    price,
    discounted_price,
    quantity
  )
VALUES (
    'TEST!!!',
    'TEST!!! 123',
    'phones...',
    200,
    100,
    15
  ) RETURNING *;

  -- Знайти телефони, які ніхто ніколи не купував
  SELECT * FROM
  products AS p LEFT JOIN orders_to_products AS otp
  ON p.id = otp.product_id
  WHERE otp.product_id IS NULL;

  -- Знайти повну вартість кожного замовлення
  SELECT otp.order_id, sum(p.price * otp.quantity) FROM
  orders_to_products AS otp INNER JOIN products AS p
  ON otp.product_id = p.id
  GROUP BY otp.order_id;

  -- Знайти кількість позицій в кожному замовленні
  SELECT order_id, count(*)
  FROM orders_to_products AS otp
  GROUP BY order_id;

  -- Знайти найпопулярніший товар
  SELECT p.brand, p.model, p.id, sum(otp.quantity) FROM
  products AS p INNER JOIN orders_to_products AS otp
  ON p.id = otp.product_id
  GROUP BY p.id
  ORDER BY sum(otp.quantity) DESC
  LIMIT 1;