{# {{ clean_and_cast_stg_columns('Project_Sales', 'ship_to_master') }} #}


select * from {{ source('Project_Sales', 'ship_to_master') }}