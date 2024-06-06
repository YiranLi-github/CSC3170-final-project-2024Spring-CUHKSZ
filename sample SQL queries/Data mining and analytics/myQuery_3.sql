select AdProviders.AP_name, sum(Ads.total_click) as 'cumulative clicks'
from Ads, AdProviders
where Ads.AP_id = AdProviders.AP_id
group by AdProviders.AP_name
order by sum(Ads.total_click) desc
limit 10