{# {{ clean_and_cast_stg_columns('Project_Sales', 'sales_hierarchy_override') }} #}


select * from {{ source('Project_Sales', 'sales_hierarchy_override') }}