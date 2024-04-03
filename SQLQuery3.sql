---1: ������ �����
 CREATE DATABASE 
 USE Footbol
 
BACKUP DATABASE Footbol
TO DISK = 'C:\Backup\Full_Backup_FilePath' WITH INIT
 
RESTORE HEADERONLY 
FROM DISK = 'C:\Backup\Differential_Backup_FilePath'
 
RESTORE DATABASE Footbol
FROM DISK = 'C:\Backup\Differential_Backup_FilePath'
WITH FILE = 1, RECOVERY
 
 
-- �������� � �������������� ���� ������ ��� �������� ������ ���������� ����������� � ��������������
DROP DATABASE Footbol
RESTORE DATABASE Footbol FROM DISK = 'C:\Backup\Full_Backup_FilePath' WITH REPLACE
 
---2: ���������������� ����� on ��������
 
BACKUP DATABASE Footbol
TO DISK = 'C:\Backup\Differential_Backup_FilePath' WITH DIFFERENTIAL, INIT
 
-- �������� ������ � ���� �������
INSERT INTO Goroda (idGoroda, oblast)
VALUES (1, '�������� ������� '),
 (2, '��������� �������');
 
-- �������� ������ � ������ �������
INSERT INTO Gubernator (idGubernator, Name, Surname, Midname, PassportSeria, PassportNomer, Obrazovanie, Prejneemestoraboty)
VALUES (1, '��������� ', '�������', '', '42 11', '567890', '�������� ��', '������ ����'),
(2, '����� ', '������', '��������', '40 33', '678944', '������������� ��', '������� ��');
 
-- ��������� ����������� ������� ����������
BACKUP LOG Footbol TO DISK = 'C:\Backup\Transaction_Log_Backup_FilePath' WITH INIT
 
--  �������� � �������������� ���� ������ ��� �������� ������ ���������� ����������� � ��������������
DROP DATABASE Footbol
RESTORE DATABASE Footbol FROM DISK = 'C:\Backup\Full_Backup_FilePath' WITH NORECOVERY
RESTORE DATABASE Footbol FROM DISK = 'C:\Backup\Differential_Backup_FilePath' WITH RECOVERY
RESTORE LOG Footbol FROM DISK = 'C:\Backup\Transaction_Log_Backup_FilePath' WITH RECOVERY
 
---3: ��������� ����������� ������� ���������� � �����
 
--  ��������� ����������� ������� ���������� ����� ���������� ������� �������
BACKUP LOG Footbol TO DISK = 'C:\Backup\Transaction_Log_Backup_FilePath1' WITH INIT
 
-- �������� ������� � ������ �������
ALTER TABLE Flights ADD FlightStatus VARCHAR(50)
 
-- �������� ��������� ����� ������� ���������� ����� ���������� ������� �������
BACKUP LOG Footbol TO DISK = 'C:\Backup\Transaction_Log_Backup_FilePath2' WITH INIT
 
-- �������� ������� �� ������ �������
ALTER TABLE Passengers ADD  Age INT
 
-- ��������� ����� ������� ���������� ����� ���������� ������� �������
BACKUP LOG Footbol TO DISK = 'C:\Backup\Transaction_Log_Backup_FilePath3' WITH INIT
 
-- �������� � �������������� ���� ������ ��� �������� ������ ���������� ����������� � ��������������
DROP DATABASE Footbol
RESTORE DATABASE Footbol FROM DISK = 'C:\Backup\Full_Backup_FilePath' WITH NORECOVERY
RESTORE LOG Footbol FROM DISK = 'C:\Backup\Transaction_Log_Backup_FilePath1' WITH NORECOVERY
RESTORE LOG Footbol FROM DISK = 'C:\Backup\Transaction_Log_Backup_FilePath2' WITH NORECOVERY
RESTORE LOG Footbol FROM DISK = 'C:\Backup\Transaction_Log_Backup_FilePath3' WITH RECOVERY
 
---4: ��������� ����������� ������� ���������� � �������
 
-- ��������� ����������� ������� ���������� ����� ���������� ������� ������������ �������
BACKUP LOG Footbol TO DISK = 'C:\Backup\Transaction_Log_Backup_FilePath1' WITH INIT
 
-- ��������� ������ ����������� �������
UPDATE Goroda SET Oblast = 'On Time' WHERE Goroda = 1
 
-- ��������� ����������� ������� ���������� ����� ���������� ������� ������������ �������
BACKUP LOG Footbol TO DISK = 'C:\Backup\Transaction_Log_Backup_FilePath2' WITH INIT
 
-- ��������� ������ ����������� �������
UPDATE Gubernator SET Age = 30 WHERE ID = 1
 
-- ��������� ����������� ������� ���������� ����� ���������� ������� ������������ �������
BACKUP LOG Footbol TO DISK = 'C:\Backup\Transaction_Log_Backup_FilePath3' WITH INIT
 
--- ������������ ������ ��������� ����� � �������, ����� ������������ ���������������� ��������� ����� �� ��������, ����� ������������ ��������� ����� ������� ����������, ��������� ����� ������� ��������.
RESTORE DATABASE Footbol FROM DISK = 'C:\Backup\Full_Backup_Friday.bak' WITH REPLACE
RESTORE DATABASE Footbol FROM DISK = 'C:\Backup\Differential_Backup_Tuesday.bak' WITH NORECOVERY
RESTORE LOG Footbol FROM DISK = 'C:\Backup\Transaction_Log_Backup_FilePath1' WITH NORECOVERY
RESTORE LOG Footbol FROM DISK = 'C:\Backup\Transaction_Log_Backup_FilePath2' WITH NORECOVERY
RESTORE LOG Footbol FROM DISK = 'C:\Backup\Transaction_Log_Backup_FilePath3' WITH RECOVERY
 
--- ������� �������, ��������� � �������
DROP TABLE Gubernator;
 
---  ��������� ����������� ������� ���������� ����� �������� �������
BACKUP LOG Footbol TO DISK = 'C:\Backup\Transaction_Log_Backup_FilePath4' WITH INIT
 
---����������� ���� ������
RESTORE DATABASE Footbol FROM DISK = 'C:\Backup\Full_Backup_Friday.bak' WITH REPLACE
RESTORE DATABASE Footbol FROM DISK = 'C:\Backup\Differential_Backup_Tuesday.bak' WITH NORECOVERY
RESTORE LOG Footbol FROM DISK = 'C:\Backup\Transaction_Log_Backup_FilePath1' WITH NORECOVERY
RESTORE LOG Footbol FROM DISK = 'C:\Backup\Transaction_Log_Backup_FilePath2' WITH NORECOVERY
RESTORE LOG Footbol FROM DISK = 'C:\Backup\Transaction_Log_Backup_FilePath3' WITH NORECOVERY
RESTORE LOG Footbol FROM DISK = 'C:\Backup\Transaction_Log_Backup_FilePath4' WITH RECOVERY
 
--- �������� ���� ������ 
 
USE Footbol
 
DROP DATABASE Footbol;