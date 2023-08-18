CREATE TABLE users_with_emails();

DROP TABLE users;

CREATE TABLE users(
    first_name varchar(64), 
    last_name varchar(64),
    biography text,
    gender varchar(30),
    is_subscribe boolean,
    birthday date,
    foot_size smallint,
    height numeric(4, 1) 
);

INSERT INTO users VALUES
                ('John','Doe','biography............','male',true,'2023-08-18',42,2.1),
                ('Jane','Doe','biography............','male',false,'2023-08-18',42,2.1),
                ('Clark','Doe','biography............','male',false,'2023-08-18',42,2.1),
                ('Donald','Doe',NULL,'male',true,'2023-08-18',NULL,NULL)
                ;