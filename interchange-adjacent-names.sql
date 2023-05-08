--From the students table, write a SQL query to interchange the adjacent student names.

--Note: If there are no adjacent student then the student name should stay the same.

--Table Structure:

create table students
(
id int primary key,
student_name varchar(50) not null
);

insert into students values (1, 'James');
insert into students values  (2, 'Michael');
insert into students values (3, 'George');
insert into students values (4, 'Stewart');
insert into students values (5, 'Robin');

select * from students;

--query
select id, student_name,
case when mod(id,2)=1 then lead(student_name,1,student_name) over(order by id)
else lag(student_name,1,student_name) over(order by id) end as student_name_revised
from students;
