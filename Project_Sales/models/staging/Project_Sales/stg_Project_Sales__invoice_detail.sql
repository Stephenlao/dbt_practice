{# {{ clean_and_cast_stg_columns('Project_Sales', 'invoice_detail') }} #}
select * from {{ source('Project_Sales', 'invoice_detail') }}