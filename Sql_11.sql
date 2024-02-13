Given a table named Logs with columns LogID, UserID, LogDate, and Action, write a SQL query to find the users who have logged in every day for the past 7 days. Include their UserID
  
SELECT UserID
FROM Logs
WHERE LogDate >= DATEADD(DAY,-6,CURRENT_DATE)
GROUP BY UserID
HAVING COUNT(DISTINCT (LogDate)) = 7;
