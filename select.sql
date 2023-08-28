-- АГРЕГАТНІ ФУНКЦІЇ

-- COUNT - підрахувати кількість
-- SUM - просумувати всі значення стовпця
-- AVG - середнє значення якогось стовпця
-- MIN - міімальне значення якогось стовпця
-- MAX - максимальне значення якогось стовпця


SELECT max(salary) FROM workers;
SELECT min(salary) FROM workers;
SELECT sum(salary) FROM workers;
SELECT avg(salary) FROM workers;

SELECT count(id) FROM users;

-- GROUP BY

-- Розрахувати середню вагу для чоловіків і жінок
SELECT gender, avg(weight) FROM users
GROUP BY gender;

-- Знайти кількість чоловіків і жінок
SELECT gender, count(id) FROM users
GROUP BY gender;

-- Порахувати середню вагу всіх користувачів, які народились після 1985 року
SELECT avg(weight) FROM users
WHERE extract('years' from birthday) > 1985;


-- Як varchar реагує на агрегатні функції?
SELECT sum(first_name) FROM users; -- поверне помилку
SELECT min(first_name) FROM users; -- поверне результат