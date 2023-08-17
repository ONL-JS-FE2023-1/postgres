CREATE TABLE users_with_emails();

DROP TABLE users;

CREATE TABLE users(
    first_name varchar(64), -- 1 symbol = 1 byte
    last_name varchar(64),
    biography text,
    gender varchar(30),
    is_subscribe boolean,
    birthday date,
    foot_size smallint,
    height numeric(4, 1) -- numeric(точність, масштаб)
);

-- 123.56 // точність - 5 // масштаб - 2

/*

char(5): '1234567' -> error, '12' -> '12   '
varchar(5): '1234567' -> error, '12' -> '12'

text -> max 1GB

*/