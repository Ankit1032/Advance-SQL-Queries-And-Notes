
--Employees with second highest salary in each department
select * from(
  select employee_id,first_name,department_id,salary,
  dense_rank() 
      over(partition by DEPARTMENT_ID order by salary desc) as sal_rank
  from employees
)
where sal_rank = 2;
