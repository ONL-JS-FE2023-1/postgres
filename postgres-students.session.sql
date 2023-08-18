DROP TABLE messages;

CREATE TABLE messages(
    id serial PRIMARY KEY,
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