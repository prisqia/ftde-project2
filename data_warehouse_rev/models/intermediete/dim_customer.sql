{{config(
    materialized="table",
    schema="intermediete"
    )}}

select *
from {{ref('customer')}}