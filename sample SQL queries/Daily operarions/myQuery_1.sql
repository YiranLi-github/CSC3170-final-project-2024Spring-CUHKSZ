select distinct Users.user_id
from Users, Preferences
where Users.user_id = Preferences.user_id and Preferences.tag_id in
(select tag_id
from Targets, Ads
where Ads.Ad_id = Targets.Ad_id and Ads.Ad_id = 30020);