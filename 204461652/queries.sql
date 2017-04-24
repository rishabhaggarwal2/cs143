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

--The below two are queries aside from the questions

-- Find names of all movies whose imdb ratings more than 98
SELECT Movie.title
	FROM (Movie 
	INNER JOIN MovieRating ON Movie.id = MovieRating.mid) 
	WHERE MovieRating.imdb > 98;

-- Find names of directors whose movies have imdb ratings more than 98
-- Realized that this doesn't show all movied from previous query because the MovieDirector data doesn't exist for all movies
SELECT CONCAT(Director.first, ' ', Director.last)
	FROM ((MovieDirector 
	INNER JOIN Director ON MovieDirector.did = Director.id) 
	INNER JOIN MovieRating ON MovieDirector.mid = MovieRating.mid) 
	WHERE MovieRating.imdb > 98;