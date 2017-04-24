CREATE TABLE Movie (
	id INT,
	title VARCHAR(100) NOT NULL,
	year INT,
	rating VARCHAR(10),
	company VARCHAR(50),
	PRIMARY KEY (id),
	UNIQUE (id),
	CHECK (year >= 0)
);


CREATE TABLE Actor (
	id INT,
	last VARCHAR(20),
	first VARCHAR(20),
	sex VARCHAR(6),
	dob DATE NOT NULL,
	dod DATE,
	PRIMARY KEY (id)
);


CREATE TABLE Sales (
	mid INT,
	ticketsSold INT,
	totalIncome INT,
	FOREIGN KEY (mid) references Movie(id),
	CHECK (ticketsSold >= 0 AND totalIncome >= 0)
) ENGINE = INNODB;


CREATE TABLE Director (
	id INT,
	last VARCHAR(20),
	first VARCHAR(20),
	dob DATE NOT NULL,
	dod DATE
);


CREATE TABLE MovieGenre (
	mid INT,
	genre VARCHAR(20),
	FOREIGN KEY (mid) references Movie(id)
) ENGINE = INNODB;


CREATE TABLE MovieDirector (
	mid INT,
	did INT
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
	CHECK (rating >= 0)
) ENGINE = INNODB;


CREATE TABLE MaxPersonID (
	id INT
);


CREATE TABLE MaxMovieID (
	id INT
);
