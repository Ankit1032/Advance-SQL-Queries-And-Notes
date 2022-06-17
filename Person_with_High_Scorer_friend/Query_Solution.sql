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
