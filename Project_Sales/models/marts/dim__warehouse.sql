{{ config(
    materialized='table',
    unique_key='warehouse_id'
) }}

with warehouse as (
    select * from {{ ref('stg__warehouse') }}
)

select
    *
from warehouse