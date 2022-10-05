
select * from
(select ORDER_DATE,customer_id, order_amount from customer_orders )
pivot (sum(order_amount)
    for customer_id in (100 cust_100,200 cust_200,300 cust_300,400 cust_400)
)
order by ORDER_DATE
;
