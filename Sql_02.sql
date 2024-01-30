Find the 3rd highest paid employee in every dept.
  
with cte as
(select EmployeeID, Name, Salary, Department, dense_rank() over(partition by Department order by salary desc) as rank from Employees)

select EmployeeID, Name, Salary, Department, rank from cte
where rank = 3;
