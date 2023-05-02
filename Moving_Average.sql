--Moving Average of last 4 rows
--ROWS BETWEEN 4 PRECEDING AND CURRENT ROW is a window frame specification in SQL that defines a sliding window of rows to use in a window function calculation.

with cte as (
    select invoice_no, amount
    from invoice_table
    where rownum < 10
)
select invoice_no,amount,
round(
    avg(amount) over(order by amount ROWS BETWEEN 4 PRECEDING AND CURRENT ROW)
    ,2) as Moving_Avg
from cte;
