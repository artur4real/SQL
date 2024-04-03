CREATE DATABASE FirmaEsayan;
GO
 
USE FirmaEsayan;
GO
 
CREATE TABLE FirmaEsayan (
  ID INT PRIMARY KEY,
  Name VARCHAR(50),
  Surname VARCHAR(50),
  Age INT
);
 
INSERT INTO FirmaEsayan (ID, Name, Surname, Stazh_raboti) VALUES
(1, 'Marina', 'Dbar', 10),
(2, 'Vladimir', 'Kim', 10),
(3, 'Oleg', 'Shkuratov', 12),
(4, 'Ivan', 'Ivanov', 12),
(5, 'Petr', 'Petrov', 12),
(6, 'Boris', 'Borisov', 12),
(7, 'Marina', 'Sokolova', 2),
(8, 'Molly', 'Davis', 2),
(9, 'Bailey', 'Rodriguez', 6),
(10, 'Daisy', 'Martinez', 2);
 
CREATE VIEW namer1 
AS SELECT Name, Surname FROM FirmaEsayan WHERE Stazh_raboti = 2;
 
CREATE view namer2
AS SELECT Name      
FROM FirmaEsayan WHERE Name  LIKE 'M%';
 
CREATE view namer3
 AS SELECT Name,Surname
FROM FirmaEsayan WHERE Surname LIKE '%M%';
 
CREATE view namer4
AS SELECT Name, Surname
FROM FirmaEsayan
ORDER BY Name;
 
CREATE view namer5
AS SELECT AVG (Stazh_raboti) AS AverageAge
 From FirmaEsayan
 
 CREATE view namer6
 AS SELECT MAX(Stazh_raboti) AS OldAge
 From FirmaEsayan
 
 CREATE view namer7
 AS SELECT MIN(Stazh_raboti) AS OldAge
 From FirmaEsayan
 
    AS SELECT Stazh_raboti
    FROM FirmaEsayan
    WHERE  Stazh_raboti = 2;