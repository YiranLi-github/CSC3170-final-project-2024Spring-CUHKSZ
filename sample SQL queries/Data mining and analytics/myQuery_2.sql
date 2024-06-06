select gender, avg(time_online_daily) as 'average_time_online_daily'
from Users
group by gender;