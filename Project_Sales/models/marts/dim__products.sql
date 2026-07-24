{{ config(
    materialized='table',
    unique_key='product_id'
) }}

with products as (
    select * from {{ ref('int__product_full') }}
)

select
    *
from products