-- age(date) - визначає кількість років яка минула з переданої дати
-- extract("що_саме_витягаємо" from interval) - витягає з інтервалу потрібну вам інформацію

SELECT id, first_name, last_name, extract("years" from age(birthday)) FROM users;

-- make_interval(years, months, days) - функція, яка створює інтервали
SELECT id, first_name, last_name, make_interval(20, 8) FROM users;


-- Знайти всіх користувачів, старших за 45 років
SELECT first_name, last_name, birthday, extract("years" from age(birthday)) FROM users
WHERE extract("years" from age(birthday)) > 45;


-- Знайти всіх користувачів, які народились у вересні
SELECT first_name, last_name, birthday FROM users
WHERE extract("months" from birthday) = 9;


-- Знайти всіх користувачів, від 20 до 40 років
SELECT first_name, last_name, birthday, extract("years" from age(birthday)) FROM users
WHERE extract("years" from age(birthday)) BETWEEN 20 AND 40;

-- Для всіх користувачів, які старші за 65 років підписати на розсилку
UPDATE users
SET is_subscribe = true
WHERE extract("years" from age(birthday)) > 65
RETURNING first_name, last_name, extract("years" from age(birthday));