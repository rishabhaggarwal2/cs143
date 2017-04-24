-- primary key constraint for Movie table
-- ERROR 1048 (23000): Column 'id' cannot be null
INSERT INTO Movie
VALUES (null, "Beauty and the Beast", 2017, "PG", "Disney");

-- primary key constraint for Actor table
-- ERROR 1048 (23000): Column 'id' cannot be null
INSERT INTO Actor
VALUES (null, "Watson", "Emma", "Female", '1990-05-15', '');

-- primary key constraint for Director table
-- ERROR 1048 (23000): Column 'id' cannot be null
INSERT INTO Director
VALUES (null, "Spielberg", "Steven", '1946-12-18', '');

-- foreign key constraint for sales table
-- ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails
-- (`TEST`.`Sales`, CONSTRAINT `Sales_ibfk_1` FOREIGN KEY (`mid`) REFERENCES `Movie` (`id`))
INSERT INTO Sales
VALUES (-1, 100, 100);

-- foreign key constraint for MovieGenre table
-- ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails
-- (`TEST`.`MovieGenre`, CONSTRAINT `MovieGenre_ibfk_1` FOREIGN KEY (`mid`) REFERENCES `Movie` (`id`))
INSERT INTO MovieGenre
VALUES (-1, "Horror");

-- foreign key constraint (mid) for MovieDirector table
-- ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails
-- (`TEST`.`MovieDirector`, CONSTRAINT `MovieDirector_ibfk_1` FOREIGN KEY (`mid`) REFERENCES `Movie` (`id`))
INSERT INTO MovieDirector
VALUES (-1, 37146);

-- foreign key constraint (did) for MovieDirector table
-- ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails
-- (`TEST`.`MovieDirector`, CONSTRAINT `MovieDirector_ibfk_2` FOREIGN KEY (`did`) REFERENCES `Director` (`id`))
INSERT INTO MovieDirector
VALUES (272, -1);

-- foreign key constraint (mid) for MovieRating table
-- ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails
-- (`TEST`.`MovieRating`, CONSTRAINT `MovieRating_ibfk_1` FOREIGN KEY (`mid`) REFERENCES `Movie` (`id`))
INSERT INTO MovieRating
VALUES (-1, 100, 100);

-- foreign key constraint (aid) for MovieActor table
-- ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails
-- (`TEST`.`MovieActor`, CONSTRAINT `MovieActor_ibfk_1` FOREIGN KEY (`aid`) REFERENCES `Actor` (`id`))
INSERT INTO MovieActor
VALUES (272, -1, "Hero");

-- check constraint (first name must not be null) for Actor table
INSERT INTO Actor
VALUES (200321313, "Watson", null, "Female", '1990-05-15', '');

-- check constraint (last name must not be null) for Director table
INSERT INTO Director
VALUES (200321314, null, "Steven", '1946-12-18', '');

-- check constraint (title must not be null) for Movie table
INSERT INTO Movie
VALUES (200321315, null, 2017, "PG", "Disney");
