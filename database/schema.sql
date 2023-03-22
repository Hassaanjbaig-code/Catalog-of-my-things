create table author (
    id integer primary key autoincrement,
    first_name text not null,
    last_name text not null,
    items JSONB[]
);

create table music_album (
    publish_date date not null,
    on_spotify boolean
);


CREATE TABLE book (
    publisher VARCHAR(255),
    cover_state VARCHAR(255)
);


CREATE TABLE label (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255),
    color VARCHAR(255),
    items ARRAY
);
