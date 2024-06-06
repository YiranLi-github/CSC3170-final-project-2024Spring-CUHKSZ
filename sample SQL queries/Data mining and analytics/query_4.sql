SELECT 
    distinct age, 
    NTILE(4) OVER (
        ORDER BY age
    ) group_on_age
FROM 
    users;
 
