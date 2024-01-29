Write a query to find the top three students with the highest average scores in each subject.

with sub as
(select student_name,subject, avg(score) as marks, 
 row_number() over(partition by subject order by avg(score)) as rank from Scores 
 group by student_name, subject)
 select student_name, subject, marks, rank from sub
 where rank < 4;
