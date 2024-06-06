SELECT 
   gender, location, count(user_id) as user_quantity
FROM 
    users
GROUP BY
gender, location WITH ROLLUP;