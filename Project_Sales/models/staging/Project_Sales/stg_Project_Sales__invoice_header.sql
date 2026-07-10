{# {{ clean_and_cast_stg_columns('Project_Sales', 'invoice_header') }} #}

select * from {{ source('Project_Sales', 'invoice_header') }}