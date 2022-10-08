--solved using self join
select id from(
select w1.id as id ,w1.recordDate,w1.temperature,
w2.recordDate as prev_date,w2.temperature as prev_temp
from Weather w1, Weather w2
where w1.recordDate-1 = w2.recordDate)
where temperature > prev_temp and recordDate = prev_date+1;
;

--solution using lag
-- select id from(
-- select id,temperature,
-- lag(temperature,1,99999) over(order by recordDate) as prev_temp,
-- recordDate,
-- lag(recordDate,1,'2100-12-12') over(order by recordDate) as prev_date
-- from Weather
-- )where temperature > prev_temp and recordDate = (prev_date+1);
