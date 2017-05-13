-- primary key constraint for Movie Table
INSERT INTO Movie
VALUES (null, "Get Out", 2017, "R", "Blumhouse Productions");
-- ERROR 1048 (23000): Column 'id' cannot be null

-- check constraint (title must not be null) for Movie table
INSERT INTO Movie
VALUES (200321315, null, 2017, "R", "BP");

-- check constraint (year cannot be negative) for Movie table
INSERT INTO Movie
VALUES (123456, "Get Out", -1, "R", "BP");

-- primary key constraint for Actor table
INSERT INTO Actor
VALUES (null, "Watson", "Emma", "Female", '1990-05-15', '');
-- ERROR 1048 (23000): Column 'id' cannot be null

-- primary key constraint (last cannot be null) for Actor table
INSERT INTO Actor
VALUES (12345, "Watson", "Emma", "Female", null, '');
-- ERROR 1048 (23000): Column 'dob' cannot be null

-- foreign key constraint for sales table
INSERT INTO Sales
VALUES (-1, 1, 1);
-- ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails
-- (`TEST`.`Sales`, CONSTRAINT `Sales_ibfk_1` FOREIGN KEY (`mid`) REFERENCES `Movie` (`id`))

-- check constraint (ticketsSold must be non-negative)
INSERT INTO Sales
VALUES (500, -1, 1);

-- check constraint (totalIncome must be non-negative)
INSERT INTO Sales
VALUES (500, 1, -1);

-- check constraint (dob cannot be null) for Director table
INSERT INTO Director
VALUES (1234567, "Bay", "Michael", null, '');
-- ERROR 1048 (23000) Column 'dob' cannot be null

-- primary key constraint for Director table
INSERT INTO Director
VALUES (null, "Bay", "Michael", '1946-12-18', '');
-- ERROR 1048 (23000): Column 'id' cannot be null

-- foreign key constraint for MovieGenre table
INSERT INTO MovieGenre
VALUES (-1, "Romantic Comedy");
-- ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails
-- (`TEST`.`MovieGenre`, CONSTRAINT `MovieGenre_ibfk_1` FOREIGN KEY (`mid`) REFERENCES `Movie` (`id`))

-- foreign key constraint (mid) for MovieDirector table
INSERT INTO MovieDirector
VALUES (-1, 30000);
-- ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails
-- (`TEST`.`MovieDirector`, CONSTRAINT `MovieDirector_ibfk_1` FOREIGN KEY (`mid`) REFERENCES `Movie` (`id`))

-- foreign key constraint (did) for MovieDirector table
INSERT INTO MovieDirector
VALUES (300, -1);
-- ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails
-- (`TEST`.`MovieDirector`, CONSTRAINT `MovieDirector_ibfk_2` FOREIGN KEY (`did`) REFERENCES `Director` (`id`))

-- foreign key constraint (mid) for MovieDirector table
INSERT INTO MovieActor
VALUES (-1, 30000, "Person 1");
-- ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails
-- (`TEST`.`MovieDirector`, CONSTRAINT `MovieDirector_ibfk_1` FOREIGN KEY (`mid`) REFERENCES `Movie` (`id`))

-- foreign key constraint (did) for MovieDirector table
INSERT INTO MovieActor
VALUES (300, -1, "Person 2");
-- ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails
-- (`TEST`.`MovieDirector`, CONSTRAINT `MovieDirector_ibfk_2` FOREIGN KEY (`did`) REFERENCES `Director` (`id`))

-- foreign key constraint (mid) for MovieRating table
INSERT INTO MovieRating
VALUES (-1, 100, 100);
-- ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails
-- (`TEST`.`MovieRating`, CONSTRAINT `MovieRating_ibfk_1` FOREIGN KEY (`mid`) REFERENCES `Movie` (`id`))

-- check constraint (raiting must be non-negative) for MovieRating table
INSERT INTO MovieRating
VALUES (12345, 15, -1);
