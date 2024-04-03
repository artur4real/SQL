/*транзакц бэкап*/
/*Понедельник*/
CREATE DATABASE Polyclinic
GO
USE Polyclinic
GO
CREATE TABLE Patsient(
idPatsient int NOT NULL,
Name nvarchar(30),
)
GO
CREATE TABLE Diagnoz(
idDiagnoz int NOT NULL,
Diagnoz nvarchar(30),
)
GO
BACKUP DATABASE Polyclinic
TO DISK = 'Polyclinic.bak'

 
/*Вторник*/
 
INSERT INTO Patsient (idPatsient, Name)
VALUES (2, 'Ivanov Ivan Ivanovich');

BACKUP LOG Polyclinic 
TO DISK = 'Polyclinic.bak'

 
INSERT INTO Diagnoz (idDiagnoz, Diagnoz)
VALUES (2, 'Zubnaya bol');

BACKUP LOG Polyclinic 
TO DISK = 'Polyclinic.bak'

 
/*Среда*/
ALTER TABLE Patsient ADD Date date;
ALTER TABLE Diagnoz ADD Date date;
go
 
BACKUP LOG Polyclinic 
TO DISK = 'Polyclinic.bak'


/*Четверг*/
UPDATE Patsient SET Date = '2023-03-28' WHERE idPatsient = 1;
UPDATE Patsient SET Date = '2023-03-29' WHERE idPatsient = 2;
UPDATE Patsient SET Date = '2023-03-30' WHERE idPatsient = 3;

BACKUP LOG Polyclinic 
TO DISK = 'Polyclinic.bak'


UPDATE Diagnoz SET Date = '2023-03-28' WHERE idDiagnoz = 1;
UPDATE Diagnoz SET Date = '2023-03-29' WHERE idDiagnoz = 2;
UPDATE Diagnoz SET Date = '2023-03-30' WHERE idDiagnoz = 3;

BACKUP LOG Polyclinic 
TO DISK = 'Polyclinic.bak'

 
/*Пятница*/
 
/********************/
USE master 
drop database Polyclinic
 
/********************/
 
RESTORE HEADERONLY 
FROM DISK = 'Polyclinic.bak'
 
/********************/
 
RESTORE DATABASE  Polyclinic
FROM DISK = 'Polyclinic.bak'
WITH FILE = 3, norecovery

RESTORE DATABASE  Polyclinic
FROM DISK = 'Polyclinic.bak'
WITH FILE = 8, recovery
 
/********************/