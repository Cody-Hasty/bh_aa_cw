PRAGMA foreign_keys = ON;
/* How to drop all tables before running the following commands? */

CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  fname TEXT NOT NULL,
  lname TEXT NOT NULL
);

CREATE TABLE questions (
  id INTEGER PRIMARY KEY,
  title TEXT NOT NULL,
  body TEXT NOT NULL,
  author_id INTEGER,

  FOREIGN KEY (author_id) REFERENCES users(id)
);

CREATE TABLE question_follows (
  id INTEGER PRIMARY KEY,
  author_id INTEGER,
  question_id INTEGER,

  FOREIGN KEY (author_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);

CREATE TABLE replies (
  id INTEGER PRIMARY KEY,
  body TEXT NOT NULL,
  author_id INTEGER,
  question_id INTEGER,
  parent_id INTEGER,

  FOREIGN KEY (author_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (parent_id) REFERENCES replies(id)
);

CREATE TABLE question_likes (
  id INTEGER PRIMARY KEY,
  user_id INTEGER,
  question_id INTEGER,

  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);

INSERT INTO
  users (fname, lname)
VALUES
  ('Brittany', 'Hasty'),
  ('TJ', 'McCabe'),
  ('Eyal', 'Garbi');

INSERT INTO
  questions (title, body, author_id)
VALUES 
  ('Why', 'Why me, oh God?', (SELECT id FROM users WHERE fname = 'TJ' AND lname = 'McCabe')),
  ('Who', 'Who decided I deserve this?', (SELECT id FROM users WHERE fname = 'TJ' AND lname = 'McCabe')),
  ('How', 'How do I make a drinks table?', (SELECT id FROM users WHERE fname = 'Eyal' AND lname = 'Garbi')),
  ('When', 'When is lunch?', (SELECT id FROM users WHERE fname = 'Brittany' AND lname = 'Hasty')),
  ('When_again', 'When do I get to go home?', (SELECT id FROM users WHERE fname = 'Brittany' AND lname = 'Hasty'));

INSERT INTO
  replies (body, author_id, question_id, parent_id)
VALUES
  ('Samesies- Eyal do you know?',
  (SELECT id FROM users WHERE fname = 'TJ' AND lname = 'McCabe'),
  (SELECT id FROM questions WHERE title = 'When'),
  NULL
  );

INSERT INTO
  replies (body, author_id, question_id, parent_id)
VALUES
  ("I think it's 12:40",
  (SELECT id FROM users WHERE fname = 'Eyal' AND lname = 'Garbi'),
  (SELECT id FROM questions WHERE title = 'When'),
  (SELECT id FROM replies WHERE body = 'Samesies- Eyal do you know?')
  );

INSERT INTO
  question_follows (author_id, question_id)
VALUES
  (1,1),
  (1,5),
  (2,1),
  (2,2);

INSERT INTO
  question_likes (user_id, question_id)
VALUES
  (1,1),
  (1,3),
  (1,5),
  (3,1),
  (3,2),
  (3,3),
  (3,5);