CREATE DATABASE temp;  -- create database

DROP DATABASE temp;  -- drop database

BACKUP DATABASE AnimeDB TO DISK = 'C:\Users\Bhanu Prakash\Downloads\SQL\AnimeDBBackUp.bak'; -- backup
BACKUP DATABASE AnimeDB TO DISK = 'C:\Users\Bhanu Prakash\Downloads\SQL\AnimeDBBackUp.bak' WITH DIFFERENTIAL; -- only changes

CREATE TABLE TEMP (id int, name nvarchar(20));  -- create table

TRUNCATE TABLE TEMP; -- truncate table, only records deleted not table

DROP TABLE TEMP;  -- delete table, table along with records deleted

ALTER TABLE TEMP ADD salary DECIMAL;  -- alter add
ALTER TABLE TEMP DROP COLUMN age; -- alter delete
ALTER TABLE TEMP ALTER COLUMN age BIT; -- alter update

CREATE TABLE ConstraintsExample (
id int NOT NULL PRIMARY KEY IDENTITY(100,2),
-- address int  NOT NULL FOREIGN KEY REFERENCES Address(address_id),
age int NOT NULL CHECK (age>=18),
country nvarchar DEFAULT 'Not Specified',
email nvarchar NOT NULL UNIQUE);

SELECT * FROM Character;  -- all columns

SELECT character_name,is_villain FROM Character;  -- specific columns

SELECT DISTINCT is_villain,character_name FROM Character; -- distinct keyword

SELECT character_name FROM Character WHERE is_villain=0; -- where clause

SELECT character_name FROM Character WHERE is_villain<>0; -- where not equals to, != can also be used

SELECT * FROM Anime WHERE anime_id BETWEEN 1 AND 3;  -- BETWEEN clause

SELECT character_name from Character WHERE character_name LIKE 'N%'; -- LIKE clause for string matching, replaces all characters
SELECT character_name from Character WHERE character_name LIKE 'Ar_a%'; -- replaces single character
SELECT character_name from Character WHERE character_name LIKE '[ABC]%'; -- one character from the set
SELECT character_name from Character WHERE character_name LIKE '[^DEF]%';  -- not in the set
SELECT character_name from Character WHERE character_name LIKE '[P-Z]%';  -- which in the range

SELECT * FROM Anime WHERE anime_id IN (1,4);  -- IN clause
SELECT * FROM Anime WHERE anime_id IN (SELECT character_id from Character WHERE character_id%3=0);  -- subquery

SELECT character_name AS character FROM Character;  -- AS
SELECT a.anime_name,c.character_name FROM Character c, Anime a WHERE c.anime_id=a.anime_id; -- table Alias, cross join example

SELECT * FROM Character ORDER BY character_name desc, is_villain asc;  -- ORDER BY

SELECT * FROM Character WHERE Character_name LIKE 'V%' AND is_villain=1; -- AND

SELECT * FROM Character WHERE Character_name LIKE 'V%' OR is_villain=1; -- OR

SELECT * FROM Character WHERE Character_name NOT LIKE 'R%';  -- NOT

SELECT * FROM Character WHERE is_villain IS NULL; --  NULL
SELECT * FROM Character WHERE is_villain IS NOT NULL;

SELECT TOP 10 * FROM Character;  -- TOP 10 records and next is TOP 10 percent records
SELECT TOP 10 PERCENT * FROM Character;

SELECT MIN(character_id) FROM Character;  -- MIN

SELECT MAX(character_id) FROM Character;  -- MAX

SELECT COUNT(*) FROM Character;  -- COUNT
SELECT COUNT(is_villain) FROM Character;

SELECT SUM(character_id) FROM Character;  -- SUM

SELECT AVG(character_id) FROM Character;  -- AVG

SELECT COUNT(character_name) as "no of character" FROM Character GROUP BY anime_id;  -- GROUP BY

SELECT anime_id,COUNT(character_name) as "no of character" FROM Character GROUP BY anime_id HAVING COUNT(character_name)>12;  -- HAVING

SELECT * FROM Anime a INNER JOIN Character c ON a.anime_id=c.anime_id;  -- INNER JOIN
SELECT * FROM Anime a LEFT JOIN Character c ON a.anime_id=c.anime_id;  -- LEFT JOIN
SELECT * FROM Anime a RIGHT JOIN Character c ON a.anime_id=c.anime_id;  -- RIGHT JOIN
SELECT * FROM Anime a FULL JOIN Character c ON a.anime_id=c.anime_id;  -- FULL JOIN

SELECT character_name FROM Character WHERE anime_id=1  -- UNION
UNION
SELECT character_name FROM Character WHERE anime_id=4

SELECT character_name FROM Character WHERE EXISTS (SELECT character_name FROM Character WHERE character_name LIKE '%Naruto%'); -- EXISTS

SELECT * INTO CharacterBackUp23022025 FROM Character;  -- SELECT INTO

SELECT character_name, -- CASE
	CASE
		WHEN is_villain=0 THEN 'Hero'
		ELSE 'Villain'
	END as 'H/V'
	FROM Character;

SELECT character_name,COALESCE(is_villain,-1) FROM Character;  -- COALESCE

INSERT INTO Character (anime_id,character_name,is_villain) VALUES (1,'Minato Namekazi',0);  -- INSERT INTO
INSERT INTO Character VALUES (2,'Master Roshi',0),(3,'Max Mayfield',0),(4,'Ghost',0);
INSERT INTO Anime VALUES ('Demon Slayer');
INSERT INTO Character(anime_id,character_name,is_villain) SELECT anime_id,character_name,is_villain FROM CharacterBackUp23022025;  -- INSERT INTO SELECT

UPDATE Character SET is_villain=0 WHERE character_name LIKE 'Itachi%'; -- UPDATE

DELETE FROM Character WHERE character_id>52;  -- DELETE

CREATE PROCEDURE VillianInAnime @Anime INT  -- Stored procedure creation
AS
BEGIN
	SELECT * FROM Character WHERE is_villain=1 AND anime_id=@Anime;
END
GO

EXEC VillianInAnime @Anime=2;  -- execution line

CREATE INDEX characternameindex ON Character(character_name);

DROP INDEX Character.characternameindex;

CREATE VIEW onlyheros AS SELECT * FROM Character WHERE is_villain=0;

SELECT * FROM onlyheros;

CREATE OR ALTER VIEW onlyheros AS SELECT anime_id,character_name FROM Character where is_villain=0;

DROP VIEW onlyheros;

SELECT ASCII('Bhanu');

SELECT CHAR(65);

SELECT CHARINDEX('a','Bhanu');

SELECT CONCAT('Bhanu',' ','Prakash')+' Sakkuri';
SELECT CONCAT_WS(':','Virat','kohli');

SELECT SUBSTRING('ABCDEF',2,4);
SELECT LEFT('ABCDEF',3);
SELECT RIGHT('ABCDEF',3);

SELECT LOWER('BHANU');

SELECT UPPER('bhanu');

SELECT REVERSE('bhanu');

SELECT LEN('bhanu');

SELECT TRIM('     bhanu    ');
SELECT LTRIM('     bhanu    ');
SELECT RTRIM('     bhanu    ');

SELECT REPLACE('Bhanu Prakash','P','V');

SELECT GETDATE();

SELECT DATEADD(MONTH,2,'2001/01/21');

SELECT DATEDIFF(DAY,'2001/01/21','2000/10/18');

SELECT DAY('2001/01/21');
SELECT MONTH('2001/01/21');
SELECT YEAR('2001/01/21');

SELECT CAST(25.65 AS INT);