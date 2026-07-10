{# {{ clean_and_cast_stg_columns('Project_Sales', 'product_master') }} #}

select * from {{ source('Project_Sales', 'product_master') }}