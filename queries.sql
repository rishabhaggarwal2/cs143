-- Give me the names of all the actors in the movie 'Die Another Day'. Please also make sure actor names are in this format:  <firstname> <lastname>   (seperated by a single space).
SELECT CONCAT(Actor.first, ' ', Actor.last)
	FROM ((MovieActor 
	INNER JOIN Actor ON MovieActor.aid = Actor.id) 
	INNER JOIN Movie ON Movie.id = MovieActor.mid) 
	WHERE Movie.title = "Die Another Day";

-- Give me the count of all the actors who acted in multiple movies.
SELECT COUNT(*) 
FROM (
	SELECT Actor.id
	FROM Actor
	JOIN MovieActor ON MovieActor.aid = Actor.id
	GROUP BY Actor.id
	HAVING COUNT(MovieActor.aid) > 1 
) as grp;

-- Give me the title of movies that sell more than 1,000,000 tickets.
SELECT Movie.title
	FROM (Movie 
	INNER JOIN Sales ON Movie.id = Sales.mid) 
	WHERE Sales.ticketsSold > 1000000;

--Write two more queries!!!!!!
--Change data set to CS143!!!!!