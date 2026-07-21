with raw_data as
(
    select * from {{ source('Project_Sales', 'sizes') }}
)




select
    {{ clean_column('Size ID', 'int') }},
    {{ clean_column('Size Description', 'string') }},
    {{ clean_column('Size Short Name', 'string') }},
    {{ clean_column('Size Sort Order', 'int') }}





from raw_data
