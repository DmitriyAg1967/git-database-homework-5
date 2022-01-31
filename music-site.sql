create table if not exists artist (id serial primary key, artist_name text not null unique);
create table if not exists genre (id serial primary key, musical_genre text not null unique);
create table if not exists artist_genre (artist_id integer references not null artist(id),
genre_id integer references not null unique genre(id),
constraint pk primary key (artist_id, genre_id));
create table if not exists album (id serial primary key, album_title text not null unique, year_of_issue integer not null);
create table if not exists artist_album (artist_id integer not null references artist(id),
album_id integer not null unique references album(id),
constraint pk_1 primary key (artist_id, album_id));
create table if not exists track (id serial primary key, album_id integer references album(id), name_of_the_track text not null unique, duration numeric not null);
alter table track alter column album_id set not null;
create table if not exists collections (id serial primary key, music_collections text not null unique, year_of_issue integer not null);
create table if not exists collections_track (collections_id integer not null references collections(id),
track_id integer not null unique references track(id),
constraint pk_2 primary key (collections_id, track_id));