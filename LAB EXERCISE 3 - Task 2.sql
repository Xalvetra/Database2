USE TSQL20;
GO

SELECT e.empid, e.lastname, e.firstname, e.title, e.mgrid,
m.mgrid, m.lastname as lastname, m.firstname as mgfristname FROM HR.Employees
as e INNER JOIN HR.Employees as m on e.mgrid = m.empid;