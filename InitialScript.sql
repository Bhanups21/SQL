-- Create the Anime database
CREATE DATABASE AnimeDB;
GO

-- Use the Anime database
USE AnimeDB;
GO

-- Create the Anime table
CREATE TABLE Anime (
    anime_id INT PRIMARY KEY IDENTITY(1,1),
    anime_name VARCHAR(255) NOT NULL
);

-- Create the Character table
CREATE TABLE Character (
    character_id INT PRIMARY KEY IDENTITY(1,1),
    anime_id INT NOT NULL,
    character_name VARCHAR(255) NOT NULL,
    is_villain BIT,
    FOREIGN KEY (anime_id) REFERENCES Anime(anime_id)
);
GO

-- Insert data into the Anime table
INSERT INTO Anime (anime_name) VALUES
('Naruto'),
('Dragon Ball Super'),
('Stranger Things'),
('Game of Thrones');

-- Insert data into the Character table
INSERT INTO Character (anime_id, character_name, is_villain) VALUES
-- Naruto
(1, 'Naruto Uzumaki', 0),
(1, 'Sasuke Uchiha', 0),
(1, 'Sakura Haruno', 0),
(1, 'Kakashi Hatake', 0),
(1, 'Itachi Uchiha', 1),
(1, 'Madara Uchiha', 1),
(1, 'Pain', 1),
(1, 'Orochimaru', NULL),
(1, 'Gaara', 0),
(1, 'Jiraiya', 0),
(1, 'Tsunade', 0),
(1, 'Shikamaru Nara', 0),
(1, 'Hinata Hyuga', 0),

-- Dragon Ball Super
(2, 'Goku', 0),
(2, 'Vegeta', 0),
(2, 'Gohan', 0),
(2, 'Frieza', 1),
(2, 'Beerus', 0),  -- Technically a God of Destruction, but often acts like an antagonist
(2, 'Whis', 0),
(2, 'Jiren', 0), -- More of a rival than a pure villain
(2, 'Hit', 0),
(2, 'Zamasu', 1),
(2, 'Goku Black', 1),
(2, 'Broly', 0),

-- Stranger Things
(3, 'Eleven', 0),
(3, 'Mike Wheeler', 0),
(3, 'Dustin Henderson', 0),
(3, 'Lucas Sinclair', 0),
(3, 'Will Byers', 0),
(3, 'Jim Hopper', 0),
(3, 'Joyce Byers', 0),
(3, 'Steve Harrington', 0),
(3, 'Nancy Wheeler', 0),
(3, 'Jonathan Byers', 0),
(3, 'Billy Hargrove', NULL),
(3, 'Vecna', 1),
(3, 'Demogorgon', 1),
(3, 'Mind Flayer', 1),


-- Game of Thrones
(4, 'Jon Snow', 0),
(4, 'Daenerys Targaryen', 0),
(4, 'Tyrion Lannister', 0),
(4, 'Cersei Lannister', 1),
(4, 'Jaime Lannister', NULL),  -- Complex character
(4, 'Arya Stark', 0),
(4, 'Sansa Stark', 0),
(4, 'Ned Stark', 0),
(4, 'Khal Drogo', 0),
(4, 'The Night King', 1),
(4, 'Ramsay Bolton', 1),
(4, 'Petyr Baelish', 1),
(4, 'Varys', 0),
(4, 'Littlefinger', 1)
;
GO