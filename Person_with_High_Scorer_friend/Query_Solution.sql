/* Write a query to find personid, no. of friends, sum of marks 
of a person who have friends with total score greater than 100
*/

select * from person;

select * from friend;

with temp as (
select f.personid,sum(score) as total_friends_score ,count(f.friendid)as no_of_friends from friend f
inner join person p
on f.friendid = p.personid
group by f.personid
having sum(score) > 100
)
select t.*,p.name as person_name, p.score as score_of_person
from temp t
inner join person p
on t.personid = p.personid; 
/*

PERSONID, TOTAL_FRIENDS_SCORE, NO_OF_FRIENDS, PERSON_NAME, SCORE_OF_PERSON
2	        115	                 2	            Bob	         11
4	        101	                 3	            Tara	       45
*/

--solution
/* write a query to find personid, name, number of friends
,sum of marks of the person who have friends with total score greater than 100
*/
with temp1 as (
select p.*, f.friendid from person p
inner join friend f
on p.personid = f.personid
),temp2 as (
select t1.*,p.name as friend_name,p.score as friend_score from temp1 t1
inner join person p
on t1.friendid = p.personid)
select name,sum(friend_score) from temp2
group by name
having sum(friend_score) > 100
;
