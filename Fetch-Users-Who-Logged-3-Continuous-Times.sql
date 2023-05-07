--From the login_details table, fetch the users who logged in consecutively 3 or more times.
--We need to fetch users who have appeared 3 or more times consecutively in login details table.

--Table Structure:

create table login_details(
login_id int primary key,
user_name varchar(50) not null,
login_date date);

insert into login_details values (101, 'Michael', current_date);
insert into login_details values (102, 'James', current_date);
insert into login_details values (103, 'Stewart', current_date+1);
insert into login_details values (104, 'Stewart', current_date+1);
insert into login_details values (105, 'Stewart', current_date+1);
insert into login_details values (106, 'Michael', current_date+2);
insert into login_details values (107, 'Michael', current_date+2);
insert into login_details values (108, 'Stewart', current_date+3);
insert into login_details values (109, 'Stewart', current_date+3);
insert into login_details values (110, 'James', current_date+4);
insert into login_details values (111, 'James', current_date+4);
insert into login_details values (112, 'James', current_date+5);
insert into login_details values (113, 'James', current_date+6);

--query (self join)
select distinct ld1.user_name from login_details ld1
inner join login_details ld2 on ld1.login_id +1 = ld2.login_id and ld1.user_name = ld2.user_name
inner join login_details ld3 on ld1.login_id +2 = ld3.login_id and ld1.user_name = ld3.user_name
;

--query (LEAD window function)
select distinct repeated_names
from (
select LOGIN_ID, USER_NAME, LOGIN_DATE,
case when user_name = lead(user_name) over(order by login_id)
and  user_name = lead(user_name,2) over(order by login_id)
then user_name else null end as repeated_names
from login_details) x
where x.repeated_names is not null;


