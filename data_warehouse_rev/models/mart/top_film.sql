{{config(
    materialized="table",
    schema="mart"
    )}}

select c.title
, count(a.rental_id) as times_rented
FROM {{ref('dim_rental')}} as a
left join {{ref('dim_inventory')}} as b on a.inventory_id  = b.inventory_id
left join {{ref('dim_film')}} c on b.film_id  = c.film_id 
group by c.title
order by times_rented desc