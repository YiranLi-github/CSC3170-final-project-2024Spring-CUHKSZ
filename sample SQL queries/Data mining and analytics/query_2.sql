SELECT
 count(user_id) AS quantity, age, 
    RANK( ) OVER ( 
	ORDER BY count(user_id) DESC
	)ages_rank 
FROM users 
GROUP BY age;


