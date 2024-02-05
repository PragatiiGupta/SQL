List all employees who have at least one direct report.
  
select distinct(m.employee_name) as manager
from Employees 
as m join Employees as s on 
m.employee_id = s.manager_id;
