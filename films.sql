https://api.elephantsql.com/console/1575eb7d-75f4-4d9a-865f-9e3cd07e03e2/browser?#

-------- STANDARD --------

CREATE TABLE films (
    id SERIAL PRIMARY KEY,
    title VARCHAR(50) UNIQUE,
    genre VARCHAR(20),
    release_year INTEGER,
    score INTEGER,
    CHECK (score BETWEEN 1 AND 10)
);

INSERT INTO films (title, genre, release_year, score)
VALUES 
('Run Lola Run', 'Thriller', 1998, 9)
('The Shawshank Redemption', 'Drama', 1994, 9),
('The Godfather', 'Crime', 1972, 9),
('The Dark Knight', 'Action', 2008, 9),
('Alien', 'SciFi', 1979, 9),
('Total Recall', 'SciFi', 1990, 8),
('The Matrix', 'SciFi', 1999, 8),
('The Matrix Resurrections', 'SciFi', 2021, 5),
('The Matrix Reloaded', 'SciFi', 2003, 6),
('The Hunt for Red October', 'Thriller', 1990, 7),
('Misery', 'Thriller', 1990, 7),
('The Power Of The Dog', 'Western', 2021, 6),
('Hell or High Water', 'Western', 2016, 8),
('The Good the Bad and the Ugly', 'Western', 1966, 9),
('Unforgiven', 'Western', 1992, 7);

--All films
SELECT * FROM films
--All films ordered by rating descending
ORDER BY score DESC
--All films ordered by release year ascending
ORDER BY release_year
--All films with a rating of 8 or higher
WHERE score >= 7
--All films with a rating of 7 or lower
WHERE score <= 7
--films released in 1990
WHERE release_year = 1990
--films released before 2000
WHERE release_year < 2000
--films released after 1990
WHERE release_year > 1990
--films released between 1990 and 1999
WHERE release_year BETWEEN 1990 AND 1999
--films with the genre of "SciFi"
WHERE genre = 'SciFi'
--films with the genre of "Western" or "SciFi"
WHERE genre IN ('SciFi', 'Western')
--films with any genre apart from "SciFi"
WHERE genre != 'SciFi'
--films with the genre of "Western" released before 2000
WHERE genre = 'Western' AND release_year < 2000
--films that have the world "Matrix" in their title
WHERE title LIKE '%Matrix%'

-------- EXT 1 --------
--Return the average film rating
SELECT AVG(score) FROM films
--Return the total number of films
SELECT COUNT(title) FROM films
--Return the average film rating by genre
SELECT genre, AVG(score)FROM films
GROUP BY genre
