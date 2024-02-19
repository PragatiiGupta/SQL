Write a recursive SQL query to count the total number of employees reporting to 'John' (CEO).
  
WITH RECURSIVE CTE AS
(SELECT EmployeeID, EmployeeName, ManagerID
 FROM Employee WHERE EmployeeName = 'John'
 UNION ALL
 SELECT E.EmployeeID, E.EmployeeName, E.ManagerID
 FROM Employee E JOIN CTE C ON
 E.ManagerID = C.EmployeeID)
 SELECT COUNT(*) AS Reports FROM CTE
 WHERE ManagerID IS NOT NULL;
