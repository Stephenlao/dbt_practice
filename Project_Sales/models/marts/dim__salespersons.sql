{{ config(
    materialized='table',
    unique_key='salesperson_id'
) }}

with salespersons as (
    select * from {{ ref('int__sales_hierarchy_flatten') }}
)

select
    *
from salespersons