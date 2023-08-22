-- Реалізувати чат між юзерами
-- В кожного чата є певний власник
-- В кожного юзера може бути багато чатів (юзер може состоять в багатьох чатах)
-- В кожному чаті - багато повідомлень. Одне повідомлення - в одному чаті

CREATE TABLE chats(
    id serial PRIMARY KEY,
    name varchar(256) CHECK (name != '') NOT NULL,
    owner_id int REFERENCES users(id),
    created_at timestamp DEFAULT current_timestamp
);

INSERT INTO chats (name, owner_id) VALUES
('superchat', 1);

CREATE TABLE chats_to_users(
    chat_id int REFERENCES chats(id),
    user_id int REFERENCES users(id),
    join_at timestamp DEFAULT current_timestamp,
    PRIMARY KEY(chat_id, user_id)
);

INSERT INTO chats_to_users(chat_id, user_id) VALUES
(2, 3);

INSERT INTO chats_to_users(chat_id, user_id) VALUES
(2, 1);


CREATE TABLE messages(
    id serial PRIMARY KEY,
    body text CHECK (body != '') NOT NULL,
    created_at timestamp DEFAULT current_timestamp,
    is_read boolean DEFAULT false NOT NULL,
    author_id int,
    chat_id int,
    FOREIGN KEY (chat_id, author_id) REFERENCES chats_to_users(chat_id, user_id) 
);

INSERT INTO messages(body, author_id, chat_id) VALUES
('Hi', 3, 2),
('Hi Clark', 1, 2),
('Go for coffee?', 1, 2),
('Go', 3, 2);