drop view if exists Ad_tag_cnts;
create view Ad_tag_cnts as
	select Clicks.Ad_id, Preferences.tag_id, count(*) as 'cnt'
	from Clicks, Preferences
	where Clicks.user_id = Preferences.user_id
	group by Clicks.Ad_id, Preferences.tag_id;

select Ad_tag_cnts.Ad_id, Ad_tag_cnts.tag_id
from Ad_tag_cnts
where (Ad_tag_cnts.Ad_id, Ad_tag_cnts.cnt) in (
	select Ad_tag_cnts.Ad_id, max(Ad_tag_cnts.cnt)
    from Ad_tag_cnts
    group by Ad_tag_cnts.Ad_id)
order by Ad_tag_cnts.Ad_id;