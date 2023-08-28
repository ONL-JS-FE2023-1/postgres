/*

1. Знайдіть середню вагу всіх чоловіків, яким 27 років
2. Знайдіть середній вік всіх користувачів
3. Знайдіть мінімальний та максимальний вік користувачів
3.1 Знайти мінімальний і максимальний вік окремо, жінок і чоловіків

*/

-- 1
SELECT avg(weight) FROM users
WHERE extract('years' from age(birthday)) = 27 AND gender = 'male';

-- 2
SELECT avg(extract('years' from age(birthday))) FROM users;

-- 3
SELECT min(extract('years' from age(birthday))) AS "min age", max(extract('years' from age(birthday))) AS "max age"
FROM users;

-- 3.1
INSERT INTO users(first_name, last_name, email, gender, birthday, is_subscribe) VALUES
('TEST', 'TESTOVICH', 'TEST.TESTOVICH@GMAIL.COM', 'female', '1900-08-03', true)
RETURNING *;

SELECT gender, min(extract('years' from age(birthday))) AS "min age", max(extract('years' from age(birthday))) AS "max age"
FROM users
GROUP BY gender;