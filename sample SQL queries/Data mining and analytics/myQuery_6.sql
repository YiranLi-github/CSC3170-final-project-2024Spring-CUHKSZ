drop view if exists Target_users;
create view Target_users as
	select distinct Preferences.user_id, Targets.Ad_id
	from Preferences, Targets
	where Preferences.tag_id = Targets.tag_id;

drop view if exists Target_counts;
create view Target_counts as 
	select Target_users.Ad_id, count(*) as 'target_count'
	from Target_users
	group by Target_users.Ad_id;
 
drop view if exists Target_click_counts;
create view Target_click_counts as
	select Target_users.Ad_id, count(*) as 'target_click_count'
	from Clicks, Target_users
	where Clicks.user_id = Target_users.user_id and Clicks.Ad_id = Target_users.Ad_id
	group by Target_users.Ad_id;

select Target_counts.Ad_id, Target_click_counts.target_click_count/Target_counts.target_count as 'target_user_click_rate'
from Target_counts, Target_click_counts
where Target_counts.Ad_id = Target_click_counts.Ad_id
order by target_user_click_rate desc