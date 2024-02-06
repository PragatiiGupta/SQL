List all the managers with their subordinates.
  
select m.employee_name as manager,s.employee_name subordinate 
from Employees 
as m left join Employees as s on 
m.employee_id = s.manager_id;
