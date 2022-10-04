
Q. Count all the new and repeated customers on each day

/*
OUTPUT:
Order_date  New_customer_count  Repeat_customer_count
01-01-22    3                   0
02-01-22    2                   1
03-01-22    1                   2
*/

create table customer_orders (
order_id integer,
customer_id integer,
order_date date,
order_amount integer
);

insert into customer_orders values(1,100,TO_DATE ('2022-01-01', 'yyyy-mm-dd'),2000);
insert into customer_orders values(2,200,TO_DATE('2022-01-01', 'yyyy-mm-dd'),2500);
insert into customer_orders values(3,300,TO_DATE('2022-01-01', 'yyyy-mm-dd'),2100);
insert into customer_orders values(4,100,TO_DATE('2022-01-02', 'yyyy-mm-dd'),2000);
insert into customer_orders values(5,400,TO_DATE('2022-01-02', 'yyyy-mm-dd'),2200);
insert into customer_orders values(6,500,TO_DATE('2022-01-02', 'yyyy-mm-dd'),2700);
insert into customer_orders values(7,100,TO_DATE('2022-01-03', 'yyyy-mm-dd'),3000);
insert into customer_orders values(8,400,TO_DATE('2022-01-03', 'yyyy-mm-dd'),1000);
insert into customer_orders values(9,600,TO_DATE('2022-01-03', 'yyyy-mm-dd'),3000);


--Solution
with first_visit as (
    select customer_id,min(order_date) as first_visit_date
    from customer_orders c1
    group by(customer_id)
    ), 
visit_flag as(
    select co.*,fv.first_visit_date,
    case when co.order_date = fv.first_visit_date then 1 else 0 end as New_customer_flag,
    case when co.order_date <> fv.first_visit_date then 1 else 0 end as Repeat_customer_flag
    from customer_orders co
    inner join first_visit fv
    on co.customer_id = fv.customer_id
    order by co.order_id)
select order_date, sum(New_customer_flag) as New_customer_count, sum(Repeat_customer_flag) as Repeat_customer_count
from visit_flag
group by order_date
order by order_date asc;


--Optimized Solution
with first_visit as (
    select customer_id,min(order_date) as first_visit_date
    from customer_orders c1
    group by(customer_id)
    )
    select co.order_date,
    sum(case when co.order_date = fv.first_visit_date then 1 else 0 end) as New_customer_count,
    sum(case when co.order_date <> fv.first_visit_date then 1 else 0 end) as Repeat_customer_count,
    from customer_orders co
    inner join first_visit fv
    on co.customer_id = fv.customer_id
    group by co.order_date
    order by co.order_date;
		
=== Assignment ===

/*
OUTPUT:
Order_date  New_customer_count  Repeat_customer_count	New_customer_order_amount	Repeat_customer_order_amount
01-01-22    3                   0
02-01-22    2                   1
03-01-22    1                   2
*/


--Optimized Solution
with first_visit as (
    select customer_id,min(order_date) as first_visit_date
    from customer_orders c1
    group by(customer_id)
    )
    select co.order_date,
    sum(case when co.order_date = fv.first_visit_date then 1 else 0 end) as New_customers_count,
    sum(case when co.order_date <> fv.first_visit_date then 1 else 0 end) as Repeat_customers_count,
    sum(case when co.order_date = fv.first_visit_date then order_amount else 0 end) as New_customers_order_amount,
    sum(case when co.order_date <> fv.first_visit_date then order_amount else 0 end) as Repeat_customers_order_amount
    from customer_orders co
    inner join first_visit fv
    on co.customer_id = fv.customer_id
    group by co.order_date
    order by co.order_date;


--One More Solution
with temp as
(select ORDER_ID, CUSTOMER_ID, ORDER_DATE, ORDER_AMOUNT,
dense_rank() over(partition by customer_id order by order_date) as cust_rank
from customer_orders
), temp2 as(
select ORDER_DATE,
case when cust_rank = 1 then 1 else 0 end new_cust,
case when cust_rank <> 1 then 1 else 0 end repeat_cust
from temp)
select ORDER_DATE,sum(new_cust) as new_customers_count,sum(repeat_cust) as repeat_customers_count from temp2
group by ORDER_DATE
;


