CREATE TABLE icc_world_cup(
    Team_1 varchar2(50),
    Team_2 varchar2(50),
    Winner varchar2(50)
);

insert into icc_world_cup values('India','SL','India');
insert into icc_world_cup values('SL','Aus','Aus');
insert into icc_world_cup values('SA','Eng','Eng');
insert into icc_world_cup values('Eng','NZ','NZ');
insert into icc_world_cup values('Aus','India','India');


--Solution 1
select Team_Name,Matches_Played,count(icc.winner) as Matches_Won,Matches_Played - count(icc.winner) as Matches_Lost
from (
    select Team_Name,count(Team_Name) as Matches_Played
    from(
        select team_1 as Team_Name from icc_world_cup
        union all
        select team_2 from icc_world_cup
        )
    group by Team_Name
    ) left join icc_world_cup icc
on Team_Name = icc.winner
group by Team_Name,Matches_Played
;



--Solution 2
select team_1 as Team_Name,count(team_1) as Matches_Played,sum(win_flag) as Matches_Won,count(team_1) - sum(win_flag) as Matches_Lost
from (
    select team_1, case when team_1 = winner then 1 else 0 end as win_flag
    from icc_world_cup
    union all
    select team_2,case when team_2 = winner then 1 else 0 end as win_flag
    from icc_world_cup
    )
group by team_1
order by Matches_Won desc;
    


