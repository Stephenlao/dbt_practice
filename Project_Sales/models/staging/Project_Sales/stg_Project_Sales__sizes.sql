{# {{ clean_and_cast_stg_columns('Project_Sales', 'sizes') }} #}

select * from {{ source('Project_Sales', 'sizes') }}