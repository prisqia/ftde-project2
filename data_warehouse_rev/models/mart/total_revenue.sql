{{config(
    materialized="table",
    schema="mart"
    )}}

select sum(amount) as total_revenue
, {{ date_trunc("month", "payment_date") }} as order_month
from  {{ref('fact_payment')}}
group by {{ date_trunc("month", "payment_date") }} 