CREATE TABLE employees(
    id serial PRIMARY KEY,
    name varchar(200),
    position varchar(300) REFERENCES positions(name)
);

INSERT INTO employees(name, position) VALUES
('John', 'HR manager'),
('Jane', 'Sales manager'),
('Jake', 'Team Lead'),
('Andrew', 'Driver'),
('Loki', 'JS Fullstack Developer'),
('Draw', 'Sales manager');

CREATE TABLE positions(
    name varchar(300) PRIMARY KEY,
    department varchar(300),
    is_car_avability boolean
);

INSERT INTO positions(name, is_car_avability) VALUES
('HR manager', false),
('Sales manager', false),
('Team Lead', true),
('Driver', true),
('JS Fullstack Developer', true);

SELECT employees.id, employees.name, employees.position, positions.is_car_avability FROM
employees JOIN positions
ON employees.position = positions.name;