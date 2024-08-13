{{config(
    materialized="table",
    schema="mart"
    )}}

select concat(a.first_name, ' ', a.last_name) as actor_name
, count(fa.film_id) as total_movies
from {{ref('dim_film')}} as f 
left join {{ref('dim_film_actor')}} as fa on f.film_id  = fa.film_id 
left join {{ref('dim_actor')}} as a on fa.actor_id  = a.actor_id 
group by 1
order by total_movies desc
limit 10
