--Find all employees whose salary is greater than Manager's Salary
select 
e1.employee_id as emp_id,
e1.first_name||' '||e1.last_name as emp_name,
e1.salary as emp_sal,
e2.employee_id as manager_id,
e2.first_name||' '||e2.last_name as manager_name,
e2.salary as manager_sal
from employees e1
inner join employees e2
on e1.manager_id = e2.employee_id and e1.manager_id is not null
and e1.salary > e2.salary;
