--- Знайти всі телефони, які купував юзер з id 23
-- Не використовуючи JOINів, за допомогою виразів підзапитів
-- Завдання виконайте, створивши вьюху


--FUNCTIONS

/*
Життєвий цикл функції:
1. Ви описуєте функцію, створюєте її.
2. Ви можете за необхідності виконати функцію - її код буде виконано.
*/

/* СИНТАКСИС:

CREATE FUNCTION function_name (parametr1 data_type, parametr2 data_type)
RETURNS return_data_type
AS
$$
BEGIN
    ---- ТІЛО ФУНКЦІЇ (операції та обчислення)
    RETURN ...result....; 
END;
$$
LANGUAGE plpgsql; -- Мова програмування функції (це приклад для PostgreSQL)

*/

-- Задача:створити функцію, яка приймає 2 числа і додає їх

CREATE FUNCTION add_numbers(a integer, b integer)
RETURNS integer
AS
$$
BEGIN
    RETURN a + b;
END;
$$
LANGUAGE plpgsql;


---- виклик функції:
SELECT add_numbers(2, 3) AS "sum"; -- 5
SELECT add_numbers('a', 25); -- error 

---Видалення функцій
DROP FUNCTION add_numbers(integer, integer);