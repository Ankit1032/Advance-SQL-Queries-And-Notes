
=== Data ===
create table entries ( 
name varchar(20),
address varchar(20),
email varchar(20),
floor int,
resources varchar(10));

insert into entries 
values ('A','Bangalore','A@gmail.com',1,'CPU'),('A','Bangalore','A1@gmail.com',1,'CPU'),('A','Bangalore','A2@gmail.com',2,'DESKTOP')
,('B','Bangalore','B@gmail.com',2,'DESKTOP'),('B','Bangalore','B1@gmail.com',2,'DESKTOP'),('B','Bangalore','B2@gmail.com',1,'MONITOR')

==== OUTPUT ====
Name	Total_Visits	Most_Visited_Floors		Resources_Used
A		3				1						CPU, DESKTOP
B		3				2						DESKTOP,MONITOR

=== Query ====
with total_visits as (
    select name,count(1) as visits_count,listagg(distinct RESOURCES,',') as resources_used
    from entries
    group by name
)
,floor_visit as 
(
    select name,floor,count(floor) as floor_count,
    rank() over(partition by name order by count(floor) desc) as floor_rank
    from entries
    group by name,floor
)
select fv.name,tv.visits_count,fv.floor as most_visited_floor,tv.resources_used
from floor_visit fv
inner join total_visits tv
on fv.name = tv.name
where fv.floor_rank = 1;
