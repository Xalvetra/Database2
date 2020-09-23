SELECT 
e.empid,e.lastname,e.firstname,e.title,e.mgrid,
m.lastname AS mgrlastname, m.firstname AS mgrfirstname
FROM HR.Employees AS e
INNER JOIN HR.Employees AS m ON e.mgrid = m.empid
WHERE m.lastname=N'Buck';