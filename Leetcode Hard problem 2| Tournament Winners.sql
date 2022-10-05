--Find the player with maximum score in each group
--in case of a tie, the lowest player_id wins

create table players
(player_id int,
group_id int);

insert into players values (15,1);
insert into players values (25,1);
insert into players values (30,1);
insert into players values (45,1);
insert into players values (10,2);
insert into players values (35,2);
insert into players values (50,2);
insert into players values (20,3);
insert into players values (40,3);

create table matches
(
match_id int,
first_player int,
second_player int,
first_score int,
second_score int);

insert into matches values (1,15,45,3,0);
insert into matches values (2,30,25,1,2);
insert into matches values (3,30,15,2,0);
insert into matches values (4,40,20,5,2);
insert into matches values (5,35,50,1,1);

with temp1 as
(
select ids_of_player,sum(score) as score from
    (
        select first_player as ids_of_player,first_score as score from matches
        union all
        select second_player,second_score from matches
    )
group by ids_of_player
),temp2 as(
select p.player_id,p.group_id,t1.score,
dense_rank() over(partition by p.group_id order by t1.score desc, p.player_id asc) as player_rank
from temp1 t1
inner join players p
on t1.ids_of_player = p.player_id
)
select * from temp2
where player_rank = 1
;



