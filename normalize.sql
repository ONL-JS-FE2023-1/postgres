/*

teachers 1:m subjects

subjects m:n teachers

students m:n subjects

*/

CREATE students(
    id serial PRIMARY KEY,
    name varchar(30)
);

CREATE TABLE teachers(
    id serial PRIMARY KEY,
    name varchar(20),
    subject varchar(300) REFERENCES subjects(name)
);

-- Пов'язуємо викладача, студента та предмет

CREATE TABLE students_to_teachers(
    teacher_id int REFERENCES teachers(id),
    student_id int REFERENCES students(id),
    PRIMARY KEY(teacher_id, student_id)
);

-- Обмеження, яке ми встановили: 1 викладач може вести 1 предмет

INSERT INTO students_to_teachers VALUES
(1, 1),
(1, 2),
(2, 1),
(2, 2);

CREATE TABLE subjects(
    name varchar(300) PRIMARY KEY
);