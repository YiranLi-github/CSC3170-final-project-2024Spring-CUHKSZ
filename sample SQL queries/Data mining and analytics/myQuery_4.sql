select Tags.tag_name, Videos.video_id as most_liked_video_id, max_like_per_tag.max_like as 'like'
from Tags, Videos, Correlations, (
	select Correlations.tag_id as tag_id, max(Videos.view_count*Videos.like_rate) as max_like
    from Videos, Correlations
    where Correlations.video_id = Videos.video_id
    group by Correlations.tag_id) as max_like_per_tag
where Tags.tag_id = Correlations.tag_id and Videos.video_id = Correlations.video_id and 
	Tags.tag_id = max_like_per_tag.tag_id and Videos.view_count*Videos.like_rate = max_like_per_tag.max_like;