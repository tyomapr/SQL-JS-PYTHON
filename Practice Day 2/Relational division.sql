WITH actress AS (
    SELECT 
        actor.actor_id AS original_actor_id,
        film_actor.actor_id AS actor_id2,
        film_actor.film_id AS film_id2
    FROM actor
    JOIN film_actor ON actor.actor_id = film_actor.actor_id
    WHERE actor.actor_id IN (105, 122)
), 
all_movies AS (
    SELECT 
        actress.actor_id2 AS actor_id, 
        unnest(array_agg(actress.film_id2 ORDER BY actress.film_id2)) AS film_id_other
    FROM actress
    GROUP BY actress.actor_id2
), 
same_movies_id AS (
    SELECT 
        t1.actor_id AS actor_1, 
        t2.actor_id AS actor_2, 
        t1.film_id_other AS common_film_id  
    FROM all_movies t1
    JOIN all_movies t2
    ON t1.film_id_other = t2.film_id_other
    AND t1.actor_id > t2.actor_id
    ORDER BY t1.film_id_other
), 
same_movies_name AS (
    SELECT 
        same_movies_id.*, 
        film.title
    FROM same_movies_id
    JOIN film 
    ON same_movies_id.common_film_id = film.film_id  
)
SELECT title
FROM same_movies_name;
