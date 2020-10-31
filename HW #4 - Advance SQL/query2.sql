-- We want to find out how many of each category of film ED CHASE has starred in.

-- So return a table with "category_name" and the count of the "number_of_films" that ED was in that category.

-- Your query should return every category even if ED has been in no films in that category

-- Order by the category name in ascending order.

SELECT       C.name AS 'category_name', COUNT(A.actor_id) AS 'number_of_films'
FROM         category AS C
LEFT JOIN    film_category AS FC ON C.category_id = FC.category_id
LEFT JOIN    film AS F ON FC.film_id = F.film_id
LEFT JOIN    film_actor AS FA ON F.film_id = FA.film_id
LEFT JOIN    actor AS A ON (FA.actor_id = A.actor_id) AND (A.first_name = 'ED') AND (A.last_name = 'CHASE')
GROUP BY     C.category_id
ORDER BY     C.name ASC;


