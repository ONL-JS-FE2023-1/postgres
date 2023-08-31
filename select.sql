
  /*


  +1. Порахувати середній чек по всьому магазину.
  +2. Витягти всі замовлення вище середнього чека
  +3. Витягти всіх користувачів, в яких кількість замволень вище середнього
  +4. Витягти користувачів та кількість товару, які вони замовляли (сума по otp.quantity)


  */

  /*
  WITH ...alias... AS table
  SELECT ...
  */

  --3
  WITH orders_with_counts AS (
    -- Кількість замовлень кожного користувача
    SELECT customer_id, count(*) AS orders_count FROM orders
    GROUP BY customer_id
  )
  SELECT * FROM orders_with_counts
  JOIN users ON users.id = orders_with_counts.customer_id
  WHERE orders_with_counts.orders_count > (
    -- Середня кількість замовлень 
    SELECT avg(orders_with_counts.orders_count) FROM orders_with_counts
  );

  --4
  SELECT u.id AS user_id, first_name, last_name, sum(otp.quantity) FROM users AS u
  JOIN orders AS o
  ON u.id = o.customer_id
  JOIN orders_to_products AS otp
  ON o.id = otp.order_id
  GROUP BY u.id;