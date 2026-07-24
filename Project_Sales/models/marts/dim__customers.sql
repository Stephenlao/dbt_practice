{{ config(
    materialized='table',
    unique_key='customer_id'
) }}

with customers as (
    select * from {{ ref('stg__customer_master') }}
)

select
    *
from customers