--From the weather table, fetch all the records when London had extremely cold temperature for 3 consecutive days or more.

--Note: Weather is considered to be extremely cold then its temperature is less than zero.

--Table Structure:


create table weather
(
id int,
city varchar(50),
temperature int,
day date
);

insert into weather values (1, 'London', -1, to_date('2021-01-01','yyyy-mm-dd'));
insert into weather values (2, 'London', -2, to_date('2021-01-02','yyyy-mm-dd'));
insert into weather values (3, 'London', 4, to_date('2021-01-03','yyyy-mm-dd'));
insert into weather values (4, 'London', 1, to_date('2021-01-04','yyyy-mm-dd'));
insert into weather values (5, 'London', -2, to_date('2021-01-05','yyyy-mm-dd'));
insert into weather values (6, 'London', -5, to_date('2021-01-06','yyyy-mm-dd'));
insert into weather values (7, 'London', -7, to_date('2021-01-07','yyyy-mm-dd'));
insert into weather values (8, 'London', 5, to_date('2021-01-08','yyyy-mm-dd'));


select * from weather;

--query1
select * from(
    select id,temperature,
    case 
        --first record
        when temperature < 0 and lead(temperature,1,999) over(order by id) < 0 and lead(temperature,2,999) over(order by day) < 0
        then 'Consecutive'
        --second record
        when temperature < 0 and lag(temperature,1,999) over(order by id) < 0 and lead(temperature,1,999) over(order by day) < 0
        then 'Consecutive'
        --third record
        when temperature < 0 and lag(temperature,1,999) over(order by id) < 0 and lag(temperature,2,999) over(order by day) < 0
        then 'Consecutive'
        --else 
        else 'Not_Consecutive' end as TEMP
    from weather
)
where TEMP = 'Consecutive'
;

