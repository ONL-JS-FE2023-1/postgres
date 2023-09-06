--Задача: написати матеріалізовану вьюху, яка буде рахувати кількість замовлень

CREATE MATERIALIZED VIEW total_orders AS
SELECT count(*) AS "загальна_кількість_замовлень"
FROM orders; 

SELECT * FROM total_orders;

---

INSERT INTO orders (customer_id, status)
VALUES (
    105,
    false
);

---Оновлення матеріалізованої вьюхи

REFRESH MATERIALIZED VIEW total_orders;


--Функція, яка оновлює вьюху при виклику
CREATE FUNCTION refresh_materialized_view()
RETURNS void
AS
$$
BEGIN
    REFRESH MATERIALIZED VIEW total_orders;
END;
$$
LANGUAGE plpgsql;

SELECT refresh_materialized_view();

-- Видалення матеріалізованої вьюхи

DROP MATERIALIZED VIEW total_orders;

--

DROP FUNCTION refresh_materialized_view;