--Extract
select extract(month from order_date) 
from customer_orders;

select extract(day from order_date) 
from customer_orders;

--to_char
select to_char(to_date(order_date,'YYYY-MM-DD HH24:MI:SS'),'WW')
from customer_orders;

select order_date,to_char(to_date(order_date,'YYYY-MM-DD HH24:MI:SS'),'DY')
from customer_orders;

select to_char(to_date(order_date,'YYYY-MM-DD HH24:MI:SS'),'YYYY')--Extract
select extract(month from order_date) 
from customer_orders;

select extract(day from order_date) 
from customer_orders;

--to_char
select to_char(to_date(order_date,'YYYY-MM-DD HH24:MI:SS'),'WW')
from customer_orders;

select order_date,to_char(to_date(order_date,'YYYY-MM-DD HH24:MI:SS'),'DY')
from customer_orders;

select to_char(to_date(order_date,'YYYY-MM-DD HH24:MI:SS'),'YYYY')
from customer_orders;

--check if the day is a weekday or weekend
select customer_id,order_date,
case when to_char(order_date,'DY') in ('SAT','SUN') then 'WEEKEND' else 'WEEKDAY' end
from customer_orders;

--add n days or hour or months or minutes
select to_char(sysdate,'YYYY-MM-DD HH24:MI:SS') current_date,
to_char(sysdate+1,'YYYY-MM-DD HH24:MI:SS') plus_1_day,
to_char(sysdate+1/24,'YYYY-MM-DD HH24:MI:SS') plus_1_hour,
to_char(sysdate+1/24/60,'YYYY-MM-DD HH24:MI:SS') plus_1_minutes,
to_char(sysdate+1/24/60/60,'YYYY-MM-DD HH24:MI:SS') plus_1_second
from dual;

--add n months
select add_months(sysdate,10) from dual;

--difference in days between 2 dates
select to_date('2022-01-23','YYYY-MM-DD') - to_date('2022-01-20','YYYY-MM-DD') DATEDIFF
FROM DUAL;

--difference in minutes between 2 days
select (to_date('2022-01-23','YYYY-MM-DD') 
- to_date('2022-01-20','YYYY-MM-DD')) * 24 * 60 as DATEDIFF
FROM DUAL;

--NO.OF BUSINESS DAYS BETWEEN TWO DATES
select (to_date('2022-02-16','YYYY-MM-DD') - to_date('2022-02-04','YYYY-MM-DD')) as days_between,
to_char(to_date('2022-02-16','YYYY-MM-DD'),'WW') - to_char(to_date('2022-02-04','YYYY-MM-DD'),'WW') as weeks_between,
(to_date('2022-02-16','YYYY-MM-DD') - to_date('2022-02-04','YYYY-MM-DD')) - 
2* (to_char(to_date('2022-02-16','YYYY-MM-DD'),'WW') - to_char(to_date('2022-02-04','YYYY-MM-DD'),'WW')) as business_days
from dual;

--Age of a Customer
select (sysdate - to_date('1998-03-27','YYYY-MM-DD')) / 365 from dual; --doesn't count leap year
select months_between(sysdate,to_date('1998-03-27','YYYY-MM-DD')) / 12 from dual;


select trunc(sysdate) from dual;
