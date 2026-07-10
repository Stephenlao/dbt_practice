{# {{ clean_and_cast_stg_columns('Project_Sales', 'warehouses') }} #}

select * from {{ source('Project_Sales', 'warehouses') }}