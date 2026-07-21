with raw_data as
(
    select * from {{ source('Project_Sales', 'styles') }}
)




select
    {{ clean_column('Style ID', 'int') }},
    {{ clean_column('Style Description', 'string') }},
    {{ clean_column('Style Short Name', 'string') }},
    {{ clean_column('Brand', 'string') }},
    {{ clean_column('Product Group', 'string') }},
    {{ clean_column('Season', 'string') }},
    {{ clean_column('Order UOM', 'int') }}

from raw_data
