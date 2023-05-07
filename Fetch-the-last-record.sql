--Write a SQL query to fetch the last record from a employee table.

--Tables Structure:

create table employee1
( emp_ID int primary key
, emp_NAME varchar(50) not null
, DEPT_NAME varchar(50)
, SALARY int);

insert into employee1 values(101, 'Mohan', 'Admin', 4000);
insert into employee1 values(102, 'Rajkumar', 'HR', 3000);
insert into employee1 values(103, 'Akbar', 'IT', 4000);
insert into employee1 values(104, 'Dorvin', 'Finance', 6500);
insert into employee1 values(105, 'Rohit', 'HR', 3000);
insert into employee1 values(106, 'Rajesh',  'Finance', 5000);
insert into employee1 values(107, 'Preet', 'HR', 7000);
insert into employee1 values(108, 'Maryam', 'Admin', 4000);
insert into employee1 values(109, 'Sanjay', 'IT', 6500);
insert into employee1 values(110, 'Vasudha', 'IT', 7000);
insert into employee1 values(111, 'Melinda', 'IT', 8000);
insert into employee1 values(112, 'Komal', 'IT', 10000);
insert into employee1 values(113, 'Gautham', 'Admin', 2000);
insert into employee1 values(114, 'Manisha', 'HR', 3000);
insert into employee1 values(115, 'Chandni', 'IT', 4500);
insert into employee1 values(116, 'Satya', 'Finance', 6500);
insert into employee1 values(117, 'Adarsh', 'HR', 3500);
insert into employee1 values(118, 'Tejaswi', 'Finance', 5500);
insert into employee1 values(119, 'Cory', 'HR', 8000);
insert into employee1 values(120, 'Monica', 'Admin', 5000);
insert into employee1 values(121, 'Rosalin', 'IT', 6000);
insert into employee1 values(122, 'Ibrahim', 'IT', 8000);
insert into employee1 values(123, 'Vikram', 'IT', 8000);
insert into employee1 values(124, 'Dheeraj', 'IT', 11000);

--query1
select * from
(
    select * from employee1
    order by emp_id desc
)
where rownum <= 1;

--query2
select * from(
select EMP_ID, EMP_NAME, DEPT_NAME, SALARY,
row_number() over(order by EMP_ID desc) as emp_rank
from employee1
)
where emp_rank <=1
;

