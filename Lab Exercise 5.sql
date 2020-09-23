USE TSQL20;
GO

SELECT a.empid, a.firstname, a.lastname,b.calendardate
FROM HR.Employees AS a CROSS JOIN HR.Calendar as b;