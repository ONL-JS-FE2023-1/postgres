-- Реалізувати сутність контенту
-- У контенту є:
-- назва
-- опис
-- автор (юзер, який створив цей контент)
-- таймстемп створення

-- Реакції
-- is_liked
        -- null - користувач не ставив оцінку
        -- true - контент лайкнули
        -- false -- контент дизлайкнули


-- У контента може бути багато реакцій від користувачів
-- Реакції - зв'язок між користувачем і контентом


CREATE TABLE contents(
    id serial PRIMARY KEY,
    name varchar(256) CHECK (name != '') NOT NULL,
    description text,
    author_id int REFERENCES users(id),
    created_at timestamp DEFAULT current_timestamp
);

INSERT INTO contents(name, description, author_id) VALUES
('funny dogs', NULL, 4);

CREATE TABLE reactions(
    content_id int REFERENCES contents(id),
    user_id int REFERENCES users(id),
    is_liked boolean
);

INSERT INTO reactions VALUES(
    1, 2, false
);