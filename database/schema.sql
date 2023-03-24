create table music_album (
    publish_date date not null,
    on_spotify boolean
);

CREATE TABLE book (
    publisher VARCHAR(255),
    cover_state VARCHAR(255)
);

CREATE TABLE genre (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    items ARRAY
);

CREATE TABLE label (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255),
    color VARCHAR(255),
    items ARRAY
);

CREATE TABLE game (
    id SERIAL PRIMARY KEY,
    multiplayer BOOLEAN,
    last_played_at TIMESTAMP,
    publish_date TIMESTAMP,
);

CREATE TABLE author (
    id SERIAL PRIMARY KEY,
    first_name varchar(255),
    last_name varchar(255)
);

CREATE TABLE item (
    id SERIAL PRIMARY KEY,
    title varchar(255),
    publish_date date,
    author_id integer REFERENCES author(id)
    genre_id integer REFERENCES genre(id)
    label_id integer REFERENCES label(id)
    archived boolean
);
