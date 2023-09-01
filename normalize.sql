DROP TABLE employees, positions;



CREATE TABLE employees(
    id serial PRIMARY KEY,
    name varchar(200),
    department varchar(200),
    department_phone varchar(15)
);

INSERT INTO employees(name, department, department_phone) VALUES
('John Doe', 'HR', '23-12-44'),
('Jane Doe', 'Sales', '12-18-18'),
('Clark Doe', 'TOP-managment', '99-99-99'),
('Test Testovich', 'JS Fullstack Developers', '56-56-56');

CREATE TABLE departments(
    name varchar(200) PRIMARY KEY,
    phone_number varchar(15)
);


INSERT INTO departments VALUES
('HR', '23-12-44'),
('Sales', '12-18-18'),
('TOP-managment', '99-99-99'),
('JS Fullstack Developers', '56-56-56');

---

ALTER TABLE employees
DROP COLUMN department_phone;

---

ALTER TABLE employees
ADD FOREIGN KEY(department)
REFERENCES departments(name);
