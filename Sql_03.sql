Write a query to find the items and their purchase dates for customers who have made multiple purchases on different dates.
  
select customer_id, purchase_date
FROM purchases
WHERE customer_id IN (
    SELECT customer_id
    FROM purchases
    GROUP BY customer_id
    HAVING COUNT(DISTINCT purchase_date) > 1
);
