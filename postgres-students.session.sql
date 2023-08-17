CREATE TABLE users_with_emails();

DROP TABLE users, users_with_emails;

CREATE TABLE users(
    first_name varchar(64), -- 1 symbol = 1 byte
    last_name varchar(64),
    biography text
);

/*

char(5): '1234567' -> error, '12' -> '12   '
varchar(5): '1234567' -> error, '12' -> '12'

text -> max 1GB

*/