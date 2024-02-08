Create a query to find employees who have more subordinates than any other employee in the organization.
  
with cte as
(select m.employee_name,
dense_rank() over(order by count(s.employee_name) desc)
as sub_rank
from Employees m join Employees s
on m.employee_id = s.manager_id
group by m.employee_name)
select * from cte where sub_rank = 1;
