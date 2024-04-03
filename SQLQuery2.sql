----ПОЛНЫЙ----
-- Понедельник день создана БД и ее таблиц
CREATE DATABASE test
BACKUP DATABASE FirmaEsayan 
TO DISK = 'FirmaEsayan_bac.bac'
-- Вторник внесение массива данных в одну из таблиц бд, затем во вторую
 
-- Среда добавление столбца в одну таблицу, затем добавление столбца в другую таблицу
 
-- Четверг заполнение первого добавленного столбца, затем заполнение второго столбца
 
-- Пятница удаление таблицы в 16:00
 
BACKUP DATABASE FirmaEsayan 
TO DISK = 'FirmaEsayan_bac.bac'
 
-- Удаление БД
DROP DATABASE FirmaEsayan
 
-- Восстановление из полного бэкапа
RESTORE HEADERONLY
FROM DISK = 'FirmaEsayan_bac.bac'
 
BACKUP DATABASE FirmaEsayan 
TO DISK = 'FirmaEsayan_bac.bac'
 
CREATE TABLE mytable5 (Name char(1000))
 
BACKUP DATABASE FirmaEsayan 
TO DISK = 'FirmaEsayan_bac.bac'
 
USE master
 
DROP DATABASE FirmaEsayan
 
RESTORE HEADERONLY
FROM DISK = 'FirmaEsayan_bac.bac'
 
RESTORE DATABASE Polyclinic 
FROM DISK = 'Polyclinic_bac.bac'
WITH FILE = 1
----РАЗНОСТНЫЙ----
-- Понедельник день создана БД и ее таблиц
BACKUP DATABASE Polyclinic 
TO DISK = 'Polyclinic_bac.bac'
-- Вторник внесение массива данных в одну из таблиц бд, затем во вторую
 
-- Среда добавление столбца в одну таблицу, затем добавление столбца в другую таблицу
 
-- Четверг заполнение первого добавленного столбца, затем заполнение второго столбца
 
-- Пятница удаление таблицы в 16:00
 
-- Удаление БД
DROP DATABASE Polyclinic
 
-- Восстановление БД
RESTORE HEADERONLY 
FROM DISK  = 'Polyclinic_bac.bac'
 
RESTORE DATABASE Polyclinic
FROM DISK  = 'Polyclinic_bac.bac'
WITH FILE = 1, NORECOVERY 
 
RESTORE DATABASE Polyclinic
FROM DISK  = 'Polyclinic_bac.bac'
WITH FILE = 2, RECOVERY 
----ТРАНЗАКЦИОННЫЙ----
USE master 
 
DROP DATABASE Polyclinic
 
RESTORE HEADERONLY 
FROM DISK  = 'Polyclinic_bac.bac'
 
RESTORE DATABASE Polyclinic
FROM DISK  = 'Polyclinic_bac.bac'
WITH FILE = 2, NORECOVERY 
 
RESTORE LOG Polyclinic
FROM DISK  = 'Polyclinic_bac.bac'
WITH FILE = 3, RECOVERY 
 
RESTORE LOG Polyclinic
FROM DISK  = 'Polyclinic_bac.bac'
WITH FILE = 4, RECOVERY 
 
RESTORE LOG Polyclinic
WITH RECOVERY 
 