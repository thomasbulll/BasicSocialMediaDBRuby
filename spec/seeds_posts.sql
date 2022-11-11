
TRUNCATE TABLE posts RESTART IDENTITY;


INSERT INTO posts (id, title, content, views, user_id) VALUES ('1', 'new phone', 'I got a new phone', 50, 1);
INSERT INTO posts (id, title, content, views, user_id) VALUES ('2', 'new phone', 'I got a new phone', 1000, 2);
INSERT INTO posts (id, title, content, views, user_id) VALUES ('3', 'new phone', 'I got a new phone', 10, 3);
INSERT INTO posts (id, title, content, views, user_id) VALUES ('4', 'new phone', 'I got a new phone', 500, 4);
INSERT INTO posts (id, title, content, views, user_id) VALUES ('5', 'another new phone', 'I got a second new phone', 10000, 2);