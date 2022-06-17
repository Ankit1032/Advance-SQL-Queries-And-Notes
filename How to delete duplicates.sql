delete from employees where rowid in (
select rowid from(
    select rowid,employee_id,first_name, 
    row_number() over(partition by employee_id order by employee_id) as emp_id_rownum
    from employees) 
where emp_id_rownum = 1
);
