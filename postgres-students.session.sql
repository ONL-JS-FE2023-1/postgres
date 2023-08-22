DELETE FROM contents WHERE id = 1;

-- ON DELETE CASCADE

DROP TABLE reactions;

team_id int REFERENCES teams(id)

CREATE TABLE reactions(
    content_id int REFERENCES contents(id) ON DELETE CASCADE,
    user_id int REFERENCES users(id),
    is_liked boolean
);

INSERT INTO reactions VALUES (
    1, 1, true
);