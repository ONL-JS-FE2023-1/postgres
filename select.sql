SELECT id, concat(first_name, ' ', last_name) AS "full name", gender, email FROM users;

-- Знайдіть всіх користувачів, повне ім'я (ім'я + прізвище) яких > 20 символів

-- варіант 1
SELECT 
id, 
concat(first_name, ' ', last_name) AS "full name", 
gender, 
email,
char_length(concat(first_name, ' ', last_name)) AS "full name length" 
FROM users
WHERE char_length(concat(first_name, ' ', last_name)) > 20;


-- варіант 2
SELECT * FROM (
  SELECT id, concat(first_name, ' ', last_name) AS "full name", gender FROM users
) AS "FN"
WHERE char_length("FN"."full name") > 20;
