CREATE TABLE books(
    id serial PRIMARY KEY,
    author varchar(60) CHECK (author != ''),
    name varchar(100) CHECK(name != '') UNIQUE,
    year varchar(4),
    publisher varchar(100),
    synopsys text,
    quantity int CHECK(quantity >= 0)
);

INSERT INTO books(author, name, year, publisher, synopsys, quantity) VALUES
('aUTHOR 2', 'Name 1', '1990', 'publisher 1', '......', 4);

-- NULL 
-- ''
