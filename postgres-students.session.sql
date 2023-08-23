DELETE FROM contents
WHERE id = 1;
DELETE FROM contents;
-- ON DELETE CASCADE
DROP TABLE reactions;
team_id int REFERENCES teams(id) CREATE TABLE reactions(
    content_id int REFERENCES contents(id) ON DELETE CASCADE,
    user_id int REFERENCES users(id),
    is_liked boolean
);
INSERT INTO reactions
VALUES (1, 1, true);
-- CREATE TABLE orders(
-- ...
-- user_id int REFERENCES users(id) ON DELETE CASCADE ON UPDATE CASCADE
-- ...
--)
UPDATE users
SET gender = 'female'
WHERE id = 2;



INSERT INTO users (
        first_name,
        last_name,
        email,
        gender,
        is_subscribe,
        birthday,
        foot_size,
        height
    )
VALUES (
        'John',
        'Pavlov',
        'john.pavlov@gmail.com',
        'male',
        true,
        '1990-08-23',
        45,
        190.5
    ) RETURNING *;