-- Find the actor_id, first_name and last_name of all actors who have never been in a Sci-Fi film.
-- Order by the actor_id in ascending order.
-- Put your query for Q4 here

SELECT      A.actor_id, A.first_name, A.last_name
FROM        actor AS A
INNER JOIN  film_actor AS FA ON A.actor_id = FA.actor_id
INNER JOIN  film AS F ON FA.film_id = F.film_id
INNER JOIN  film_category AS FC ON F.film_id = FC.film_id
INNER JOIN  category AS C ON FC.category_id = C.category_id
WHERE       A.actor_id NOT IN (SELECT      A.actor_id
                               FROM        actor AS A
                               INNER JOIN  film_actor AS FA ON A.actor_id = FA.actor_id
                               INNER JOIN  film AS F ON FA.film_id = F.film_id
                               INNER JOIN  film_category AS FC ON F.film_id = FC.film_id
                               INNER JOIN  category AS C ON FC.category_id = C.category_id
                               WHERE       C.name = 'Sci-Fi')
GROUP BY    A.actor_id
ORDER BY    A.actor_id ASC;