{{config(
    materialized="table",
    schema="raw"
    )}}

select *
from {{source('public','film_actor')}}