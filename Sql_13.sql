Write a recursive SQL query to list all employees reporting to 'Alice' (EmployeeID 2). Include Alice in the result as well.
WITH RecursiveEmployeeCTE AS (
    SELECT EmployeeID, EmployeeName, ManagerID
    FROM Employee
    WHERE EmployeeID = 2

    UNION ALL

    SELECT e.EmployeeID, e.EmployeeName, e.ManagerID
    FROM Employee e
    JOIN RecursiveEmployeeCTE r ON e.ManagerID = r.EmployeeID
)
SELECT EmployeeID, EmployeeName
FROM RecursiveEmployeeCTE;
