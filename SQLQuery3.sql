---1: Полный бэкап
 CREATE DATABASE 
 USE Footbol
 
BACKUP DATABASE Footbol
TO DISK = 'C:\Backup\Full_Backup_FilePath' WITH INIT
 
RESTORE HEADERONLY 
FROM DISK = 'C:\Backup\Differential_Backup_FilePath'
 
RESTORE DATABASE Footbol
FROM DISK = 'C:\Backup\Differential_Backup_FilePath'
WITH FILE = 1, RECOVERY
 
 
-- Удаление и восстановление базы данных для проверки работы резервного копирования и восстановления
DROP DATABASE Footbol
RESTORE DATABASE Footbol FROM DISK = 'C:\Backup\Full_Backup_FilePath' WITH REPLACE
 
---2: дифиренцированый бэкап on Вторника
 
BACKUP DATABASE Footbol
TO DISK = 'C:\Backup\Differential_Backup_FilePath' WITH DIFFERENTIAL, INIT
 
-- Добавьте данные в одну таблицу
INSERT INTO Goroda (idGoroda, oblast)
VALUES (1, 'Брянская область '),
 (2, 'Иркутская область');
 
-- Добавить данные в другую таблицу
INSERT INTO Gubernator (idGubernator, Name, Surname, Midname, PassportSeria, PassportNomer, Obrazovanie, Prejneemestoraboty)
VALUES (1, 'Александр ', 'Богомаз', '', '42 11', '567890', 'Волжский ГУ', 'Ректор СТГУ'),
(2, 'Игорь ', 'Кобзев', 'Иванович', '40 33', '678944', 'Петербургский ТУ', 'Депутат ОД');
 
-- Резервное копирование журнала транзакций
BACKUP LOG Footbol TO DISK = 'C:\Backup\Transaction_Log_Backup_FilePath' WITH INIT
 
--  Удаление и восстановление базы данных для проверки работы резервного копирования и восстановления
DROP DATABASE Footbol
RESTORE DATABASE Footbol FROM DISK = 'C:\Backup\Full_Backup_FilePath' WITH NORECOVERY
RESTORE DATABASE Footbol FROM DISK = 'C:\Backup\Differential_Backup_FilePath' WITH RECOVERY
RESTORE LOG Footbol FROM DISK = 'C:\Backup\Transaction_Log_Backup_FilePath' WITH RECOVERY
 
---3: Резервное копирование журнала транзакций в среду
 
--  Резервное копирование журнала транзакций после добавления первого столбца
BACKUP LOG Footbol TO DISK = 'C:\Backup\Transaction_Log_Backup_FilePath1' WITH INIT
 
-- Добавьте столбец в первую таблицу
ALTER TABLE Flights ADD FlightStatus VARCHAR(50)
 
-- Создайте резервную копию журнала транзакций после добавления второго столбца
BACKUP LOG Footbol TO DISK = 'C:\Backup\Transaction_Log_Backup_FilePath2' WITH INIT
 
-- Добавьте колонку во вторую таблицу
ALTER TABLE Passengers ADD  Age INT
 
-- резервное копию журнала транзакций после добавления второго столбца
BACKUP LOG Footbol TO DISK = 'C:\Backup\Transaction_Log_Backup_FilePath3' WITH INIT
 
-- Удаление и восстановление базы данных для проверки работы резервного копирования и восстановления
DROP DATABASE Footbol
RESTORE DATABASE Footbol FROM DISK = 'C:\Backup\Full_Backup_FilePath' WITH NORECOVERY
RESTORE LOG Footbol FROM DISK = 'C:\Backup\Transaction_Log_Backup_FilePath1' WITH NORECOVERY
RESTORE LOG Footbol FROM DISK = 'C:\Backup\Transaction_Log_Backup_FilePath2' WITH NORECOVERY
RESTORE LOG Footbol FROM DISK = 'C:\Backup\Transaction_Log_Backup_FilePath3' WITH RECOVERY
 
---4: Резервное копирование журнала транзакций в четверг
 
-- Резервное копирование журнала транзакций после заполнения первого добавленного столбца
BACKUP LOG Footbol TO DISK = 'C:\Backup\Transaction_Log_Backup_FilePath1' WITH INIT
 
-- Заполнить первый добавленный столбец
UPDATE Goroda SET Oblast = 'On Time' WHERE Goroda = 1
 
-- Резервное копирование журнала транзакций после заполнения второго добавленного столбца
BACKUP LOG Footbol TO DISK = 'C:\Backup\Transaction_Log_Backup_FilePath2' WITH INIT
 
-- Заполните второй добавленный столбец
UPDATE Gubernator SET Age = 30 WHERE ID = 1
 
-- Резервное копирование журнала транзакций после заполнения второго добавленного столбца
BACKUP LOG Footbol TO DISK = 'C:\Backup\Transaction_Log_Backup_FilePath3' WITH INIT
 
--- Восстановите полную резервную копию с пятницы, затем восстановите дифференциальную резервную копию со вторника, затем восстановите резервные копии журнала транзакций, сделанные после каждого сценария.
RESTORE DATABASE Footbol FROM DISK = 'C:\Backup\Full_Backup_Friday.bak' WITH REPLACE
RESTORE DATABASE Footbol FROM DISK = 'C:\Backup\Differential_Backup_Tuesday.bak' WITH NORECOVERY
RESTORE LOG Footbol FROM DISK = 'C:\Backup\Transaction_Log_Backup_FilePath1' WITH NORECOVERY
RESTORE LOG Footbol FROM DISK = 'C:\Backup\Transaction_Log_Backup_FilePath2' WITH NORECOVERY
RESTORE LOG Footbol FROM DISK = 'C:\Backup\Transaction_Log_Backup_FilePath3' WITH RECOVERY
 
--- Удалите таблицу, созданную в пятницу
DROP TABLE Gubernator;
 
---  Резервное копирование журнала транзакций после удаления таблицы
BACKUP LOG Footbol TO DISK = 'C:\Backup\Transaction_Log_Backup_FilePath4' WITH INIT
 
---Востоновние всех данных
RESTORE DATABASE Footbol FROM DISK = 'C:\Backup\Full_Backup_Friday.bak' WITH REPLACE
RESTORE DATABASE Footbol FROM DISK = 'C:\Backup\Differential_Backup_Tuesday.bak' WITH NORECOVERY
RESTORE LOG Footbol FROM DISK = 'C:\Backup\Transaction_Log_Backup_FilePath1' WITH NORECOVERY
RESTORE LOG Footbol FROM DISK = 'C:\Backup\Transaction_Log_Backup_FilePath2' WITH NORECOVERY
RESTORE LOG Footbol FROM DISK = 'C:\Backup\Transaction_Log_Backup_FilePath3' WITH NORECOVERY
RESTORE LOG Footbol FROM DISK = 'C:\Backup\Transaction_Log_Backup_FilePath4' WITH RECOVERY
 
--- Удаление базы данных 
 
USE Footbol
 
DROP DATABASE Footbol;