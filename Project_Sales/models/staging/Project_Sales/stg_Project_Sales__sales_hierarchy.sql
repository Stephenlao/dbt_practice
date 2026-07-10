{# {{ clean_and_cast_stg_columns('Project_Sales', 'sales_hierarchy') }} #}



select * from {{ source('Project_Sales', 'sales_hierarchy') }}