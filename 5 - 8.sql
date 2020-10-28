---------------------------------------------------------------------
-- LAB 07
--
-- Exercise 3
---------------------------------------------------------------------

USE TSQL20;
GO

---------------------------------------------------------------------
-- Task 13
---------------------------------------------------------------------
CREATE TRIGGER trgDiverUpdateEmployeeToBackup On HR.Employees 
INSTEAD OF update 
AS PRINT 'trigger trgDiverUpdateEmployeeToBackup DIPANGGIL';

INSERT INTO HR.EmployeesBackup(
lastname, firstname, title, titleofcourtesy, birthdate, hiredate, [address], city, region, postalcode, country, phone, mgrid) SELECT
lastname, firstname, title, titleofcourtesy, birthdate, hiredate, [address], city, region, postalcode, country, phone, mgrid
FROM inserted;

PRINT 'karyawan dengan empid yang di HR.EmployeesBackup yang di update';
GO

---------------------------------------------------------------------
-- Task 14
---------------------------------------------------------------------
CREATE TRIGGER trgDiverDeleteEmployeeToBackup on HR.Employees 
INSTEAD OF DELETE
as print 'TRIGGER	trgDiverDeleteEmployeeToBackup dipanggil';
print 'Karyawan dengan nama : Maria Cameron di Hapus di HR.EmployeesBackup saja, Di tabel aslinya tetap';
go
delete from HR.Employees where firstname = 'Maria'; 
select * from HR.EmployeesBackup;
