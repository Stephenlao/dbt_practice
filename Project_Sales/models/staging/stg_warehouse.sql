with raw_data as
(
    select * from {{ source('Project_Sales', 'warehouses') }}
)




select
    {{ clean_column('Warehouse ID', 'int') }},
    {{ clean_column('Description', 'string') }},
    {{ clean_column('Address 1', 'string') }},
    {{ clean_column('Address 2', 'string') }},
    {{ clean_column('Address 3', 'string') }},
    {{ clean_column('City', 'string') }},
    {{ clean_column('State', 'string') }},
    {{ clean_column('Country', 'string') }},
    {{ clean_column('ZIP Code', 'string') }}

from raw_data
