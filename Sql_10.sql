Given a database with 2 tables of results of an election, find the number of seats won by each party.
  
with cte as
(SELECT r.constituency_id,c.party, rank()
over(partition by r.constituency_id order by r.votes desc) as rank
from Candidates c join Results r on
c.id = r.candidate_id)
select party, count(rank) as wins
from cte where rank = 1
group by party;
