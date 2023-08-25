-- SELECT назви_стовпців_які_вам_потрібні FROM назва_таблиці

SELECT * FROM users; -- вибірка всіх юзерів (всі стовпці)

SELECT id, email FROM users; -- вибірка всіх юзерів (специфікуємо стовпці)

SELECT id, email FROM users WHERE id >= 900; -- вибірка за умовою

SELECT id, email, gender FROM users WHERE gender = 'female'; -- вибірка за умовою

-- Знайти всіх користувачів, які підписані на наші новини
SELECT id, email, is_subscribe FROM users WHERE is_subscribe;

-- Знайти всіх користувачів, у яких висота не NULL
SELECT id, email, height FROM users WHERE height IS NOT NULL;
--                                      висота != NULL


-- Вибір всіх користувачів, у яких парний id
SELECT id FROM users WHERE id % 2 = 0;


-- Вибір всіх юзерів, в кого зріст більше 1.5
SELECT id, email, height FROM users WHERE height > 1.5;


-- Вибір всіх юзерів чоловічої статі, які підписані на наші новини
SELECT id, email, gender, is_subscribe FROM users WHERE gender = 'male' AND is_subscribe;

-- CRUD (в контексті реляційних БД)
-- create - CREATE
-- read - SELECT
-- update - UPDATE
-- delete - DELETE, TRUNCATE


-- Знайти всіх юзерів з якимось певним іменем
SELECT id, first_name FROM users WHERE first_name = 'William';

-- Знайти всіх юзерів, з іменем Уільям або Джон або Тест
SELECT id, first_name FROM users WHERE first_name IN('William', 'John', 'Test');


-- Знайти всіх юзерів, у яких id між 460 і 500 (включно)
-- 1 шлях
SELECT id, email FROM users WHERE id >= 460 AND id <= 500;
-- 2 шлях
SELECT id, email FROM users WHERE id BETWEEN 460 AND 500;

-- Знайти всіх користувачів, у яких ріст в проміжку між 1.5 і 2
SELECT id, email, height FROM users WHERE height BETWEEN 150 AND 200;


-- Знайти всіх юзерів, ім'я яких починається на букву "J"
SELECT first_name FROM users WHERE first_name LIKE 'J%';
-- LIKE - задавання шаблону // РЕГІСТР МАЄ ЗНАЧЕННЯ!
-- "%" - будь-яка кількість будь-яких символів
-- "_" - 1 будь-який символ

-- Знайти всіх користувачів, у яких рівно 5 символів у імені
SELECT first_name FROM users WHERE first_name LIKE '_____';

-- Знайти всіх користувачів, у яких ім'я складається з 3 символів і починається на "A"
SELECT first_name FROM users WHERE first_name LIKE 'A__';

-- Знайти всіх користувачів, у яких ім'я закінчується на "a"
SELECT first_name FROM users WHERE first_name LIKE '%a';



----------


ALTER TABLE users
ADD COLUMN weight int CHECK(weight != 0 AND weight > 0);


UPDATE users
SET weight = 60;


----------


-- Оновлюємо вагу: для жінок - 60, для чоловіків - 80
UPDATE users
SET weight = 60
WHERE gender = 'female';

UPDATE users
SET weight = 80
WHERE gender = 'male';

SELECT gender, weight FROM users WHERE gender = 'male';

-- Вcтановити Джону Доу (id 1) вагу 100
UPDATE users
SET weight = 100
WHERE id = 1;

-- Змінити вагу для юзерів (вага - 20 кг) у яких прізвище починається на 'J' або на 'K'
UPDATE users
SET weight = weight - 20
WHERE last_name LIKE 'J%' OR last_name LIKE 'K%'
RETURNING last_name, weight;

-- Видалити якогось певного юзера в повернути всі стовпці цього юзера
INSERT INTO users (
    first_name,
    last_name,
    email,
    gender,
    is_subscribe,
    birthday,
    foot_size,
    height,
    weight
  )
VALUES (
    'Test',
    'Testovich',
    'testttttt@gmail.com',
    'male',
    true,
    '1990-08-08',
    '45',
    190.6,
    44
  ) RETURNING *;

DELETE FROM users WHERE id = 988 RETURNING *;