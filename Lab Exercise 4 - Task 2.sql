USE TSQL20;
GO
SELECT a.empid, a.firstname, a.lastname, b.calenderdate 
FROM HR.Employees as a CROSS JOIN HR.Calender as b;