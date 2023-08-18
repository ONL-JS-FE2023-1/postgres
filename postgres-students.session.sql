CREATE TABLE users_with_emails();

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
