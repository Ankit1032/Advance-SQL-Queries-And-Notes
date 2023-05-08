--Find the top 2 accounts with the maximum number of unique patients on a monthly basis.

--Note: Prefer the account if with the least value in case of same number of unique patients

--Table Structure:

create table patient_logs
(
  account_id int,
  ac_date date,
  patient_id int
);

insert into patient_logs values (1, to_date('02-01-2020','dd-mm-yyyy'), 100);
insert into patient_logs values (1, to_date('27-01-2020','dd-mm-yyyy'), 200);
insert into patient_logs values (2, to_date('01-01-2020','dd-mm-yyyy'), 300);
insert into patient_logs values (2, to_date('21-01-2020','dd-mm-yyyy'), 400);
insert into patient_logs values (2, to_date('21-01-2020','dd-mm-yyyy'), 300);
insert into patient_logs values (2, to_date('01-01-2020','dd-mm-yyyy'), 500);
insert into patient_logs values (3, to_date('20-01-2020','dd-mm-yyyy'), 400);
insert into patient_logs values (1, to_date('04-03-2020','dd-mm-yyyy'), 500);
insert into patient_logs values (3, to_date('20-01-2020','dd-mm-yyyy'), 450);

select * from patient_logs;

--query
select * from(
    select month,ACCOUNT_ID, 
    dense_rank() over(partition by month order by PATIENT_COUNT desc) as p_rank
    from (
        select ACCOUNT_ID,to_char(ac_date,'Month') as month,
        count(distinct patient_id) as patient_count
        from patient_logs
        group by ACCOUNT_ID,to_char(ac_date,'Month') 
        order by patient_count desc
    )
)
where p_rank <=2
;
