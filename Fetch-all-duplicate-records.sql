--Write a SQL Query to fetch all the duplicate records in a table.
--Tables Structure:
create table users1
(
user_id int primary key,
user_name varchar(30) not null,
email varchar(50));

--insert values
insert into users1 values (1, 'Sumit', 'sumit@gmail.com');
insert into users1 values (2, 'Reshma', 'reshma@gmail.com');
insert into users1 values (3, 'Farhana', 'farhana@gmail.com');
insert into users1 values (4, 'Robin', 'robin@gmail.com');
insert into users1 values (5, 'Robin', 'robin@gmail.com');

--query 1
select * from users1
where user_id not in (
    select min(user_id) 
    from users1
    group by USER_NAME, EMAIL
);

--query 2
select * from(
    select user_id,user_name,email, 
    row_number() over(partition by USER_NAME, EMAIL order by user_id) as u_rank
    from users1
)
where u_rank>1
;

---To delete the duplicate query
delete from users1
where user_id not in (select min(user_id) 
    from users1
    group by USER_NAME, EMAIL
);

--print all table
select * from users1;
