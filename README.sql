CREATE TABLE IF NOT EXISTS Performers (
    	id SERIAL PRIMARY KEY,
	name varchar(40) NOT NULL,
	genre varchar(40) NOT NULL,
	album varchar(40) NOT NULL
);

CREATE TABLE IF NOT EXISTS Genres (
	id SERIAL PRIMARY KEY,
	name VARCHAR(40) NOT NULL,
	performer VARCHAR(60) NOT NULL
);

CREATE TABLE IF NOT EXISTS PerformersGenres (
	performers_id INTEGER REFERENCES Performers(id),
	genres_id INTEGER REFERENCES Genres(id),
	CONSTRAINT pk PRIMARY KEY (performers_id, genres_id)
);

CREATE TABLE IF NOT EXISTS Albums (
	id SERIAL PRIMARY KEY,
	name VARCHAR(40) NOT NULL,
	year_of_release INTEGER NOT NULL,
	performer VARCHAR(60),
	track VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS Tracks (
	id SERIAL PRIMARY KEY,
	name VARCHAR(50),
	length_of_the_song INTEGER NOT NULL,
	performer VARCHAR(40) NOT NULL,
	genre VARCHAR(40) NOT NULL,
	collection VARCHAR(60) NOT NULL,
	album_id INTEGER NOT NULL REFERENCES Albums(id)
);

CREATE TABLE IF NOT EXISTS Collections (
	id SERIAL PRIMARY KEY,
	name VARCHAR(50),
	year_of_release int not null,
	track VARCHAR(50)
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
