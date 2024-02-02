In a database with tables Students and Enrollments, write a query to find all students who have not enrolled in any courses.
    
Answer 1
select s.student_id, student_name from 
Students s left join Enrollments e on
s.student_id = e.student_id
where e.student_id is null;
    
Answer 2
select student_id, student_name
from Students
where not exists (
    select 1
    from Enrollments
    where Students.student_id = Enrollments.student_id
);
