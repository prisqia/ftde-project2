{{config(
    materialized="table",
    schema="intermediete"
    )}}

select *
from {{ref('film_actor')}}