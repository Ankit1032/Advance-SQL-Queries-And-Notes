--Write a SQL query to display only the details of employees who either earn the highest salary
--and the lowest salary in each department from the employee table.

--Tables Structure:

create table employee
( emp_ID int primary key
, emp_NAME varchar(50) not null
, DEPT_NAME varchar(50)
, SALARY int);

insert into employee values(101, 'Mohan', 'Admin', 4000);
insert into employee values(102, 'Rajkumar', 'HR', 3000);
insert into employee values(103, 'Akbar', 'IT', 4000);
insert into employee values(104, 'Dorvin', 'Finance', 6500);
insert into employee values(105, 'Rohit', 'HR', 3000);
insert into employee values(106, 'Rajesh',  'Finance', 5000);
insert into employee values(107, 'Preet', 'HR', 7000);
insert into employee values(108, 'Maryam', 'Admin', 4000);
insert into employee values(109, 'Sanjay', 'IT', 6500);
insert into employee values(110, 'Vasudha', 'IT', 7000);
insert into employee values(111, 'Melinda', 'IT', 8000);
insert into employee values(112, 'Komal', 'IT', 10000);
insert into employee values(113, 'Gautham', 'Admin', 2000);
insert into employee values(114, 'Manisha', 'HR', 3000);
insert into employee values(115, 'Chandni', 'IT', 4500);
insert into employee values(116, 'Satya', 'Finance', 6500);
insert into employee values(117, 'Adarsh', 'HR', 3500);
insert into employee values(118, 'Tejaswi', 'Finance', 5500);
insert into employee values(119, 'Cory', 'HR', 8000);
insert into employee values(120, 'Monica', 'Admin', 5000);
insert into employee values(121, 'Rosalin', 'IT', 6000);
insert into employee values(122, 'Ibrahim', 'IT', 8000);
insert into employee values(123, 'Vikram', 'IT', 8000);
insert into employee values(124, 'Dheeraj', 'IT', 11000);

--query 1
select * from (
select EMP_ID, EMP_NAME, DEPT_NAME, SALARY,
row_number() over(partition by DEPT_NAME order by SALARY desc) as max_sal_dept_rank,
row_number() over(partition by DEPT_NAME order by SALARY asc) as min_sal_dept_rank
from employee
)
where max_sal_dept_rank = 1 or min_sal_dept_rank = 1;

--query2
SELECT *
FROM employee e
INNER JOIN (
    SELECT EMP_ID, EMP_NAME, DEPT_NAME, SALARY,
    MAX(salary) OVER (PARTITION BY dept_name) AS max_salary,
    MIN(salary) OVER (PARTITION BY dept_name) AS min_salary
    FROM employee
) x
ON e.emp_id = x.emp_id
AND (e.salary = x.max_salary OR e.salary = x.min_salary)
ORDER BY x.dept_name, x.salary;
