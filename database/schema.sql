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
