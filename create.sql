CREATE TABLE Movie (
	id INT,
	title VARCHAR(100) NOT NULL, -- Every movie should have a title
	year INT,
	rating VARCHAR(10),
	company VARCHAR(50),
	PRIMARY KEY (id),
	UNIQUE (id),
	CHECK (year >= 0) -- The year of a movie should not be negative
);


CREATE TABLE Actor (
	id INT,
	last VARCHAR(20),
	first VARCHAR(20),
	sex VARCHAR(6),
	dob DATE NOT NULL, -- Date of Birth of an Actor should not be null
	dod DATE,
	PRIMARY KEY (id),
	UNIQUE (id)
);


CREATE TABLE Sales (
	mid INT,
	ticketsSold INT,
	totalIncome INT,
	FOREIGN KEY (mid) references Movie(id),
	CHECK (ticketsSold >= 0 AND totalIncome >= 0) -- Any numeric value for sales should be positive
) ENGINE = INNODB;


CREATE TABLE Director (
	id INT,
	last VARCHAR(20),
	first VARCHAR(20),
	dob DATE NOT NULL, -- A Director's DoB should not be null
	dod DATE,
	PRIMARY KEY (id)
);


CREATE TABLE MovieGenre (
	mid INT,
	genre VARCHAR(20),
	FOREIGN KEY (mid) references Movie(id)
) ENGINE = INNODB;


CREATE TABLE MovieDirector (
	mid INT,
	did INT,
	FOREIGN KEY (mid) REFERENCES Movie(id),
    FOREIGN KEY (did) REFERENCES Director(id)
) ENGINE = INNODB;


CREATE TABLE MovieActor (
	mid INT,
	aid INT,
	role VARCHAR(50),
	FOREIGN KEY (mid) references Movie(id),
	FOREIGN KEY (aid) references Actor(id)
) ENGINE = INNODB;


CREATE TABLE MovieRating (
	mid INT,
	imdb INT,
	rot INT,
	FOREIGN KEY (mid) references Movie(id)
) ENGINE = INNODB;


CREATE TABLE Review (
	name VARCHAR(20),
	time TIMESTAMP,
	mid INT,
	rating INT,
	comment VARCHAR(500),
	FOREIGN KEY (mid) references Movie(id),
	CHECK (rating >= 0) -- A Review's rating value should be non-negative
) ENGINE = INNODB;


CREATE TABLE MaxPersonID (
	id INT
);


CREATE TABLE MaxMovieID (
	id INT
);
