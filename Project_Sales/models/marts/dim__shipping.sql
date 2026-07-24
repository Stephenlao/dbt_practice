{{ config(
    materialized='table',
    unique_key='ship_to_id'
) }}

with shipping as (
    select * from {{ ref('stg__ship_to_master') }}
)

select
    *
from shipping