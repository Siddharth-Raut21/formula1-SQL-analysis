-- Problem 12: What are the most frequent reasons drivers failed to finish a race?
/* Explanation: In problem mentions that, "most frequent reasons". 
				It means that we need to count the reasons using the count() aggregation function.
                
                Use the status and results tabbles.
                join them using statusId.
                
                Apply the condition for reasons.
                In the status table there are multiple failure reasons. But races table only includes "Power unit" as failure reason.
                Also it includes the statuses as "+X Laps" as completed laps in the race.
                
                So, we need to exclude both "Finished" AND all the "+X Laps" statuses.

*/
select 
    s.status as failure_reason,
    count(*) as occurrences
from results r
join status s 
    on r.statusId = s.statusId
where   s.status not like '+%'
	and s.status <> 'Finished'
group by s.status
order by occurrences desc;