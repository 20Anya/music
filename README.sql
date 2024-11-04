CREATE TABLE IF NOT EXISTS Performers (
    	id SERIAL PRIMARY KEY,
	name varchar(40) NOT NULL
);

CREATE TABLE IF NOT EXISTS Genres (
	id SERIAL PRIMARY KEY,
	name VARCHAR(40) NOT NULL
);

CREATE TABLE IF NOT EXISTS PerformersGenres (
	performers_id INTEGER REFERENCES Performers(id),
	genres_id INTEGER REFERENCES Genres(id),
	CONSTRAINT pk PRIMARY KEY (performers_id, genres_id)
);

CREATE TABLE IF NOT EXISTS Albums (
	id SERIAL PRIMARY KEY,
	name VARCHAR(40) NOT NULL,
	year_of_release INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS Tracks (
	id SERIAL PRIMARY KEY,
	name VARCHAR(50),
	length_of_the_song INTEGER NOT NULL,
	album_id INTEGER NOT NULL REFERENCES Albums(id)
);

CREATE TABLE IF NOT EXISTS Collections (
	id SERIAL PRIMARY KEY,
	name VARCHAR(50),
	year_of_release INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS CollectionTracks (
	collection_id INTEGER REFERENCES Collections(id),
	tracks_id INTEGER REFERENCES Tracks(id),
	CONSTRAINT lk PRIMARY KEY (collection_id, tracks_id)
);

CREATE TABLE IF NOT EXISTS PerformersAlbums (
	performers_id INTEGER REFERENCES Performers(id),
	albums_id INTEGER REFERENCES Albums(id),
	CONSTRAINT sk PRIMARY KEY (performers_id, albums_id)
);

insert into performers
values(1, 'Park Jimin'), (2, 'Eminem'), (3, 'Louis Armstrong'), (4, 'V'), (5, 'Tinashe');

insert into genres 
values(1, 'k-pop'), (2, 'hip-hop'), (3, 'jazz'), (4, 'pop');

insert into albums 
values(1, 'Face', 2023), (2,'Recovery', 2019), (3,'Ella and Louis', 1956), (4, 'FRI(END)S', 2024);

insert into collections 
values (1, 'Best of K-pop', 2024), (2, 'Best of Pop', 2020), (3,'Best of Jazz', 2010),(4, 'Best of hip-hop', 2015);

insert into tracks 
values(1, 'Face-off', 000349, 1), (2, 'Interlude : Dive/my', 000210, 1), (3, 'Like Crazy',000332, 1), 
(4, 'Alone',000331, 1), (5, 'Set Me Free Pt.2',000320, 1), (6, 'Like Crazy (English Version)',000332, 1),
(7, 'Cold wind blows', 000504, 2), (8, 'Seduction', 000436, 2),
(9, 'Not afraid',000408, 2), (10, 'FRI(END)S',000228, 4),
(11, 'Moonlight in Vermont', 000339, 3), (12, 'A foggy day', 000431, 3);

insert into performersgenres 
values(1, 1), (2, 2), (3, 3), (4, 1), (5, 4);

insert into performersalbums 
values(1, 1), (2, 2), (3, 3), (4, 4);

insert into collectiontracks 
values(1, 1), (1, 2), (1, 3),(1, 4), (1, 5), (2, 6), (2, 10) , (3, 11), (3, 12), (4, 7), (4, 8), (4, 9);
