--Question a) Finding n(lets say 5) consecutive records where temperature is below zero. And table has a primary key.
--Question b) Finding n consecutive records where temperature is below zero. And table does not have primary key.
--Question c) Finding n consecutive records with consecutive date value.

--Table Structure:
create table weather
	(
		id 					int 				primary key,
		city 				varchar(50) not null,
		temperature int 				not null,
		day 				date				not null
	);

insert into weather values (1, 'London', -1, to_date('2021-01-01','yyyy-mm-dd'));
insert into weather values (2, 'London', -2, to_date('2021-01-02','yyyy-mm-dd'));
insert into weather values (3, 'London', 4, to_date('2021-01-03','yyyy-mm-dd'));
insert into weather values (4, 'London', 1, to_date('2021-01-04','yyyy-mm-dd'));
insert into weather values (5, 'London', -2, to_date('2021-01-05','yyyy-mm-dd'));
insert into weather values (6, 'London', -5, to_date('2021-01-06','yyyy-mm-dd'));
insert into weather values (7, 'London', -7, to_date('2021-01-07','yyyy-mm-dd'));
insert into weather values (8, 'London', 5, to_date('2021-01-08','yyyy-mm-dd'));
insert into weather values (9, 'London', -20, to_date('2021-01-09','yyyy-mm-dd'));
insert into weather values (10, 'London', 20, to_date('2021-01-10','yyyy-mm-dd'));
insert into weather values (11, 'London', 22, to_date('2021-01-11','yyyy-mm-dd'));
insert into weather values (12, 'London', -1, to_date('2021-01-12','yyyy-mm-dd'));
insert into weather values (13, 'London', -2, to_date('2021-01-13','yyyy-mm-dd'));
insert into weather values (14, 'London', -2, to_date('2021-01-14','yyyy-mm-dd'));
insert into weather values (15, 'London', -4, to_date('2021-01-15','yyyy-mm-dd'));
insert into weather values (16, 'London', -9, to_date('2021-01-16','yyyy-mm-dd'));
insert into weather values (17, 'London', 0, to_date('2021-01-17','yyyy-mm-dd'));
insert into weather values (18, 'London', -10, to_date('2021-01-18','yyyy-mm-dd'));
insert into weather values (19, 'London', -11, to_date('2021-01-19','yyyy-mm-dd'));
insert into weather values (20, 'London', -12, to_date('2021-01-20','yyyy-mm-dd'));
insert into weather values (21, 'London', -11, to_date('2021-01-21','yyyy-mm-dd'));


select * from weather;

--query question a) Finding n(lets say 5) consecutive records where temperature is below zero. And table has a primary key.

with temp1 as (
    select ID, CITY, TEMPERATURE, DAY,
    id - row_number() over (order by id) as diff
    from weather
    where TEMPERATURE < 0
),temp2 as (
    select ID, CITY, TEMPERATURE, DAY,diff,
    count(*) over(partition by diff order by diff) as cnt
    from temp1
)
select ID, CITY, TEMPERATURE, DAY
from temp2
where CNT=5
;


--query question b)
--Made a view ignoring primary key and unique key columns
create or replace view vw_weather as
select city, temperature, day from weather;

select * from vw_weather ;

with temp1 as (
    select city, temperature, day, 
    row_number() over(order by day asc) as id
    from vw_weather
), temp2 as (
    select id,city, temperature, day, id - row_number() over(order by id) as diff
    from temp1
    where temperature < 0
), temp3 as (
    select ID, CITY, TEMPERATURE, DAY, DIFF,
    count(*) over(partition by diff order by diff) as cnt
    from temp2
)
select CITY, TEMPERATURE, DAY from temp3
where cnt=5
;


--query question c)








