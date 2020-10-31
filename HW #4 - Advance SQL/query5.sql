-- Find the film_title of all films which feature both KIRSTEN PALTROW and WARREN NOLTE
-- Order the results by film_title in descending order.

SELECT      F.title AS 'film_title'
FROM        film AS F
INNER JOIN  film_actor AS FA1 ON F.film_id = FA1.film_id
INNER JOIN  actor AS A1 ON FA1.actor_id = A1.actor_id
INNER JOIN  film_actor AS FA2 ON F.film_id = FA2.film_id
INNER JOIN  actor AS A2 ON FA2.actor_id = A2.actor_id
WHERE       (A1.first_name = 'KIRSTEN' AND A1.last_name = 'PALTROW') AND (A2.first_name = 'WARREN' AND A2.last_name = 'NOLTE')
ORDER BY    F.title DESC;
