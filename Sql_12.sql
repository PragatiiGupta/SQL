Given a table for "Orders" (with columns: OrderID, OrderDate, and TotalAmount), write a query to find the month with the highest total sales for the year 2023.
  
WITH MonthlySales AS (
    SELECT
        EXTRACT(MONTH FROM OrderDate) AS Month,
        SUM(TotalAmount) AS TotalSales
    FROM
        Orders
    WHERE
        EXTRACT(YEAR FROM OrderDate) = 2023
    GROUP BY
        EXTRACT(MONTH FROM OrderDate)
)
SELECT
    Month,
    TotalSales
FROM
    MonthlySales
ORDER BY
    TotalSales DESC
LIMIT 1;
