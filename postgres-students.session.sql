CREATE TABLE citizens(
    id serial PRIMARY KEY,
    name varchar(256),
    age int,
    is_adult boolean GENERATED ALWAYS AS (age >= 18) STORED
                                            -- >= ---> true
                                            -- < ----> false
);

INSERT INTO citizens(name, age) VALUES (
    'Ivanov Ivan', 56
);

INSERT INTO citizens(name, age) VALUES (
    'Petrov Petr', 17
);

UPDATE citizens SET age = 18 WHERE id = 2 RETURNING *;