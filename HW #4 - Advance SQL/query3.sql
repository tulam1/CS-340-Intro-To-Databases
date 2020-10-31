-- Find the actor_id first_name, last_name and total_combined_film_length 
-- of Sci-Fi films for every actor.
-- That is the result should list the actor ids, names of all of the actors(even if an actor has not been in any Sci-Fi films) 
-- and the total length of Sci-Fi films they have been in.
-- Look at the category table to figure out how to filter data for Sci-Fi films.
-- Order your results by the actor_id in descending order.
-- Put query for Q3 here

SELECT      A.actor_id, A.first_name, A.last_name, COALESCE(SF.total,0) AS total_combined_film_length
FROM        actor AS A
LEFT JOIN   (SELECT      A.actor_id, SUM(F.length) AS total
             FROM        actor AS A
             INNER JOIN  film_actor AS FA ON A.actor_id = FA.actor_id
             INNER JOIN  film AS F ON FA.film_id = F.film_id
             INNER JOIN  film_category AS FC ON F.film_id = FC.film_id
             INNER JOIN  category AS C ON FC.category_id = C.category_id
             WHERE       C.name = 'Sci-Fi'
             GROUP BY    A.actor_id
             ORDER BY    total ASC) AS SF ON A.actor_id = SF.actor_id
ORDER BY    A.actor_id DESC;
