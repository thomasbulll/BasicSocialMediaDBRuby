# EXAMPLE USER STORY:
# (analyse only the relevant part - here the final line).

As a social network user,
So I can have my information registered,
I'd like to have a user account with my email address.

As a social network user,
So I can have my information registered,
I'd like to have a user account with my username.

As a social network user,
So I can write on my timeline,
I'd like to create posts associated with my user account.

As a social network user,
So I can write on my timeline,
I'd like each of my posts to have a title and a content.

As a social network user,
So I can know who reads my posts,
I'd like each of my posts to have a number of views.

NOUNS: user email, user username, user posts, post title, post content, post views

##2. Infer the Table Name and Columns

Put the different nouns in this table. Replace the example with your own nouns.

Record        Properties
------------|-------------
posts	    | title, content, views
user	    | email, username

1. Name of the first table (always plural): user

    Column names: email, username

2. Name of the second table (always plural): posts

    Column names: title, content, views

##3. Decide the column types.

# EXAMPLE:

Table: user
id: SERIAL
email: text
username: text

Table: posts
id: SERIAL
title: text
content: text
views: int

##4. Decide on The Tables Relationship

Most of the time, you'll be using a one-to-many relationship, and will need a foreign key on one of the two tables.

To decide on which one, answer these two questions:

Can one [TABLE ONE] have many [TABLE TWO]? (Yes/No)
Can one [TABLE TWO] have many [TABLE ONE]? (Yes/No)
You'll then be able to say that:

[A] has many [B]
And on the other side, [B] belongs to [A]
In that case, the foreign key is in the table [B]
Replace the relevant bits in this example with your own:

# EXAMPLE

1. Can one user have many posts? YES
2. Can one post have many users? NO

-> Therefore,
-> A user HAS MANY posts
-> A posts BELONGS TO a user

-> Therefore, the foreign key is on the comment table.
If you can answer YES to the two questions, you'll probably have to implement a Many-to-Many relationship, which is more complex and needs a third table (called a join table).

##4. Write the SQL.

-- EXAMPLE
-- file: albums_table.sql

-- Replace the table name, columm names and types.

-- Create the table without the foreign key first.
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  email text,
  username text
);


CREATE TABLE posts (
  id SERIAL PRIMARY KEY,
  title text,
  content text,
  views int,
  user_id int,
  constraint fk_user foreign key(user_id)
    references users(id)
);

INSERT INTO users (id, email, username) VALUES ('1', 'tom@gmail.com', 'tom'), ('2', 'simo@gmail.com, 'simo'), ('3', 'will@gmail.com', 'will'), ('4', 'roi@gmail.com', 'roi');

