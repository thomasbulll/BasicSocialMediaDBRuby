TRUNCATE TABLE users, posts RESTART IDENTITY;



INSERT INTO users (id, username, email) VALUES ('1', 'Lucy', 'Lucy@gmail.com');
INSERT INTO users (id, username, email) VALUES ('2', 'Eloise', 'Eloise@gmail.com');
INSERT INTO users (id, username, email) VALUES ('3', 'Bailey', 'Bailey@gmail.com');
INSERT INTO users (id, username, email) VALUES ('4', 'George', 'George@gmail.com');

INSERT INTO posts (id, title, content, views, user_id) VALUES ('1', 'new phone', 'I got a new phone', 50, 1);
INSERT INTO posts (id, title, content, views, user_id) VALUES ('2', 'new phone', 'I got a new phone', 1000, 1);
INSERT INTO posts (id, title, content, views, user_id) VALUES ('3', 'new phone', 'I got a new phone', 10, 1);
INSERT INTO posts (id, title, content, views, user_id) VALUES ('4', 'new phone', 'I got a new phone', 500, 1);
INSERT INTO posts (id, title, content, views, user_id) VALUES ('5', 'another new phone', 'I got a second new phone', 10000, 2);