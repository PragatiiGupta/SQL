Create a recursive SQL query to find the highest manager (CEO) of an employee with the name 'Charlie'.
  
WITH RECURSIVE CTE AS
(SELECT EmployeeID, EmployeeName, ManagerID
 FROM Employee WHERE EmployeeName = 'Charlie'
 UNION ALL
 SELECT E.EmployeeID,E.EmployeeName, E.ManagerID
 FROM Employee E JOIN CTE C ON
 E.EmployeeID = C.ManagerID)
 SELECT LAST_VALUE(EmployeeName) OVER() AS CEO FROM
 CTE LIMIT 1;
