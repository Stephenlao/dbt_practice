{{ config(
    materialized='view'
) }}

with products as (
    select * from {{ ref('stg__product_master') }}
),

styles as (
    select * from {{ ref('stg__styles') }}
),

colors as (
    select * from {{ ref('stg__colors') }}
),

sizes as (
    select * from {{ ref('stg__sizes') }}
)

select
      -- product_id
    products.product_id,
    products.product_description,

    -- style_id
    products.style_id,
    styles.style_description,
    styles.style_short_name,
    styles.brand,
    styles.product_group,
    styles.season,
    styles.order_uom,

    -- color_id
    products.color_id,
    colors.color_description,
    colors.color_short_name,

    -- size_id
    products.size_id,
    sizes.size_description,
    sizes.size_short_name,
    sizes.size_sort_order,

    -- price
    products.list_price,
    products.standard_cost,
    products.first_introduction_date,
    products.closeout_date

from products
left join styles 
    on products.style_id = styles.style_id
left join colors 
    on products.color_id = colors.color_id
left join sizes 
    on products.size_id = sizes.size_id