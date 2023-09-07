/*
ДЗ. Вирішити проблеми:
1. Відсутність ключа у юзерів. Ключем має бути мейл
2. Надлишкові дані про співробітників потребують нормалізації.
Провести декомпозицію таблиці employees на дві таблиці:
співробітники та відділи

(-) 3. Зберігання паролю у сирому вигляді. Паролі мають зберігатись у захешованому вигляді
password -> password_hash

*/



-- 1

ALTER TABLE newtask.users
ADD PRIMARY KEY(email);


ALTER TABLE newtask.employees
ADD COLUMN id serial PRIMARY KEY;

-- 2

CREATE TABLE newtask.positions(
    id serial PRIMARY KEY,
    department varchar(200) NOT NULL CHECK(department != ''),
    position varchar(200) NOT NULL CHECK(position != '')
);

ALTER TABLE newtask.employees
DROP COLUMN department;

ALTER TABLE newtask.employees
DROP COLUMN position;

ALTER TABLE newtask.employees
ADD COLUMN position_id int REFERENCES newtask.positions(id);





/*

1. Атомарність - виконуються або всі запити, або не виконується жоден


---Зняття готівки у банку -> транзакції (на стороні банку)
1. Сума коштів на вашому рахунку має зменшитись на ту сумму, яку ви знімаєте
2. Фізична видача коштів у банкоматі

*/