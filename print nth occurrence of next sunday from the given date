
--SUNDAY 1
--MONDAY 2
--SATURDAY 7

select to_char(to_date('2022-03-28','YYYY-MM-DD'),'Day') FROM DUAL;
select 8 - to_char(to_date('2022-03-28','YYYY-MM-DD'),'D') FROM DUAL;
select to_date('2022-03-28','YYYY-MM-DD') + 6 from dual;

--PRINT THE DATE OF NEXT COMING SUNDAY
select to_date('2022-04-28','YYYY-MM-DD') + (8 - to_char(to_date('2022-04-28','YYYY-MM-DD'),'D')) as Date_, 
to_char(to_date('2022-04-28','YYYY-MM-DD') + (8 - to_char(to_date('2022-04-28','YYYY-MM-DD'),'D')),'DAY') as Day
from dual;

--PRINT THE NEXT NTH OCCURANCE OF SUNDAY FROM THE DATE GIVEN
select to_date('2022-04-28','YYYY-MM-DD') + (8 - to_char(to_date('2022-04-28','YYYY-MM-DD'),'D')) + (7*3)as Date_,
to_char(to_date('2022-04-28','YYYY-MM-DD') + (8 - to_char(to_date('2022-04-28','YYYY-MM-DD'),'D')) + (7*3),'Day') as day_
from dual;



