select Users.user_name, sum(Videos.view_count*Videos.like_rate) as total_likes
from Users, Publishments, Videos
where Users.user_id = Publishments.user_id and Videos.video_id = Publishments.video_id
group by Users.user_name
order by sum(Videos.view_count*Videos.like_rate) desc
limit 10