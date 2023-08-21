DROP TABLE messages;

CREATE TABLE messages(
    id serial PRIMARY KEY, -- PRIMARY KEY = UNIQUE, NOT NULL
    body text NOT NULL CHECK (body != ''),
    author varchar(256) NOT NULL CHECK (author != ''),
    created_at timestamp DEFAULT current_timestamp,
    is_read boolean DEFAULT false
)

-- 2023-08-18 <<--- date
-- 09:08:32
-- 2023-08-18 09:08:32  <<------ timestamp

INSERT INTO messages (author, body) VALUES 
                                    ('Me', 'Hello'),
                                    ('Dmytro', 'Hi'),
                                    ('Me', 'Go to coffee'),
                                    ('Dmytro', 'ok'); 

-- 3 John 'Hi' 2023-08-18 19:50:25
-- 4 John 'Hi' 2023-08-18 19:50:25




DROP TABLE users;

CREATE TABLE users(
    first_name varchar(64) NOT NULL CONSTRAINT first_name_not_empty CHECK (first_name != ''), 
    last_name varchar(64) NOT NULL CONSTRAINT last_name_not_empty CHECK (last_name != ''),
    email text NOT NULL CHECK (email != '') UNIQUE,
    gender varchar(30) NOT NULL,
    is_subscribe boolean NOT NULL,
    birthday date CHECK (birthday <= current_date),
    foot_size smallint,
    height numeric(4, 1) 
);

INSERT INTO users VALUES
                ('John','Doe','jodo1@gmail.com','male',true,'2023-08-18',42,2.1),
                ('Jane','Doe','jodo2@gmail.com','male',false,'2023-08-18',42,2.1),
                ('Clark','Doe','jodo3@gmail.com','male',false,'2023-08-18',42,2.1),
                ('Donald','Doe','jodo4@gmail.com','male',true,'2023-08-18',NULL,NULL)
                ;

INSERT INTO users VALUES ('TEST3','TEST3','test4@gmail.com','male',true,'2026-08-19',42,2.1);
















CREATE TABLE products(
    id serial PRIMARY KEY,
    brand varchar(200) NOT NULL,
    model varchar(300) NOT NULL,
    description text,
    price numeric(10, 2) NOT NULL CHECK (price > 0),
    discounted_price numeric(10, 2) CHECK(discounted_price <= price)
);

INSERT INTO products(brand, model, price) VALUES 
('Tovar 1', 'Model 1', 200),
('Tovar 2', 'Model 2', 400),
('Tovar 3', 'Model 3', 600),
('Tovar 4', 'Model 4', 800);

INSERT INTO products(brand, model, price) VALUES
('Tovar 1', 'Model 1', 200);




ALTER TABLE products 
ADD CONSTRAINT "unique_brand_model_pair" UNIQUE(brand, model);


ALTER TABLE products
ADD COLUMN quantity int;

ALTER TABLE products
ADD CONSTRAINT "products_quantity_check" CHECK (quantity >= 0);

ALTER TABLE products
DROP CONSTRAINT "products_quantity_check";