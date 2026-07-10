{# {{ clean_and_cast_stg_columns('Project_Sales', 'styles') }} #}


select * from {{ source('Project_Sales', 'styles') }}