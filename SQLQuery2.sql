----������----
-- ����������� ���� ������� �� � �� ������
CREATE DATABASE test
BACKUP DATABASE FirmaEsayan 
TO DISK = 'FirmaEsayan_bac.bac'
-- ������� �������� ������� ������ � ���� �� ������ ��, ����� �� ������
 
-- ����� ���������� ������� � ���� �������, ����� ���������� ������� � ������ �������
 
-- ������� ���������� ������� ������������ �������, ����� ���������� ������� �������
 
-- ������� �������� ������� � 16:00
 
BACKUP DATABASE FirmaEsayan 
TO DISK = 'FirmaEsayan_bac.bac'
 
-- �������� ��
DROP DATABASE FirmaEsayan
 
-- �������������� �� ������� ������
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
----����������----
-- ����������� ���� ������� �� � �� ������
BACKUP DATABASE Polyclinic 
TO DISK = 'Polyclinic_bac.bac'
-- ������� �������� ������� ������ � ���� �� ������ ��, ����� �� ������
 
-- ����� ���������� ������� � ���� �������, ����� ���������� ������� � ������ �������
 
-- ������� ���������� ������� ������������ �������, ����� ���������� ������� �������
 
-- ������� �������� ������� � 16:00
 
-- �������� ��
DROP DATABASE Polyclinic
 
-- �������������� ��
RESTORE HEADERONLY 
FROM DISK  = 'Polyclinic_bac.bac'
 
RESTORE DATABASE Polyclinic
FROM DISK  = 'Polyclinic_bac.bac'
WITH FILE = 1, NORECOVERY 
 
RESTORE DATABASE Polyclinic
FROM DISK  = 'Polyclinic_bac.bac'
WITH FILE = 2, RECOVERY 
----��������������----
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
 