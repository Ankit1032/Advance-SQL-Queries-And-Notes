/*find 20% of the products which give 80% of the sales*/
--2297200.8603 is the total sales
--1837760.68824 is the 80% of total sales

select * from (
with temp as 
(
    select product_id,sum(sales) as total_product_sales
    from superstore_orders
    group by product_id
    order by total_product_sales desc
)
select product_id,sum(total_product_sales) over(order by total_product_sales desc) as sales_running_total
from temp)
where sales_running_total <= (select 0.8 * sum(sales) from superstore_orders);

