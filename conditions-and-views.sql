CREATE SCHEMA newtask;


/*

Зробити дві ніяк між собою не пов'язані таблиці.

users: login, email, password
employees: salary, department, position, hire_date, name

*/

CREATE TABLE newtask.users(
    login varchar(200) NOT NULL CHECK (login != ''),
    email varchar(300) NOT NULL CHECK(email != ''),
    password varchar(300) NOT NULL CHECK(password != '')
);

CREATE TABLE newtask.employees(
    name varchar(200) NOT NULL CHECK (name != ''),
    salary int NOT NULL CHECK(salary > 0),
    department varchar(200) NOT NULL CHECK(department != ''),
    position varchar(200) NOT NULL CHECK(position != ''),
    hire_date date DEFAULT current_date
);


/*
ДЗ. Вирішити проблеми:
1. Відсутність ключа у юзерів. Ключем має бути мейл
2. Надлишкові дані про співробітників потребують нормалізації.
Провести декомпозицію таблиці employees на дві таблиці:
співробітники та відділи

(-) 3. Зберігання паролю у сирому вигляді. Паролі мають зберігатись у захешованому вигляді
password -> password_hash

*/