
  /*


  1. Порахувати середній чек по всьому магазину.
  2. Витягти всі замовлення вище середнього чека
  3. Витягти всіх користувачів, в яких кількість замволень вище середнього
  4. Витягти користувачів та кількість телефонів, які вони замовляли (кількість телефонів * quantity)


  */

  -- 1
  SELECT avg(owc.cost) FROM (
    -- запит знаходить суму кожного замовлення
    SELECT otp.order_id, sum(p.price * otp.quantity) AS cost FROM
    orders_to_products AS otp INNER JOIN products AS p
    ON otp.product_id = p.id
    GROUP BY otp.order_id
  ) AS owc;


  -- 2
  
  SELECT owc.* FROM (
    -- запит знаходить суму кожного замовлення
    SELECT otp.order_id, sum(p.price * otp.quantity) AS cost FROM
    orders_to_products AS otp INNER JOIN products AS p
    ON otp.product_id = p.id
    GROUP BY otp.order_id
  ) AS owc 
  WHERE owc.cost > (
    -- запит знаходить середній чек по всьому магазину
    SELECT avg(owc.cost) FROM (
    -- запит знаходить суму кожного замовлення
    SELECT otp.order_id, sum(p.price * otp.quantity) AS cost FROM
    orders_to_products AS otp INNER JOIN products AS p
    ON otp.product_id = p.id
    GROUP BY otp.order_id
  ) AS owc
  );


  --- WITH

  /*
  WITH ...alias... AS table
  SELECT ...
  */

  WITH orders_with_cost AS (
    -- запит знаходить суму кожного замовлення
    SELECT otp.order_id, sum(p.price * otp.quantity) AS cost FROM
    orders_to_products AS otp INNER JOIN products AS p
    ON otp.product_id = p.id
    GROUP BY otp.order_id
  )
  SELECT orders_with_cost.* FROM orders_with_cost
  WHERE orders_with_cost.cost > (
    -- запит знаходить середній чек по всьому магазину
    SELECT avg(orders_with_cost.cost) FROM orders_with_cost
  );