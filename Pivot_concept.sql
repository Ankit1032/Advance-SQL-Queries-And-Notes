--pivot example 1
select * from
(select ORDER_DATE,customer_id, order_amount from customer_orders )
pivot (sum(order_amount)
    for customer_id in (100 cust_100,200 cust_200,300 cust_300,400 cust_400)
)
order by ORDER_DATE
;

--pivot example 2
select * from
(select CUSTOMER_ID, ORDER_DATE, ORDER_AMOUNT from customer_orders)
pivot (sum(ORDER_AMOUNT) 
    for ORDER_DATE in ('01-01-22','02-01-22','03-01-22')
)
order by CUSTOMER_ID
;

