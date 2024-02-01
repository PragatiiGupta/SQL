write a SQL query to find the customers who have placed the most orders.
  
select c.customer_name, count(order_id) as qty from Orders o
join Customers c on o.customer_id = c.customer_id
group by o.customer_id
order by qty desc
limit 1;
OR
select customer_name from (
select c.customer_name, count(order_id) as qty,rank() over(order by count(order_id) desc) as rank
from Orders o
join Customers c on o.customer_id = c.customer_id
group by o.customer_id)
where rank = 1;
