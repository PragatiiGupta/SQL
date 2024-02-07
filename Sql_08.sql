In a table of employees with columns employee_id, employee_name, manager_id, and salary, write a query to find the highest-paid employee for each manager.
  
with cte as
(select m.employee_name as manager, s.employee_name as sub,
s.salary as salary, row_number() over(partition by s.manager_id
order by s.salary desc) as highest_paid
from Employees m join Employees s
on m.employee_id = s.manager_id)
select * from cte where highest_paid = 1;
