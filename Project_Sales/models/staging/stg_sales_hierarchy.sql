with raw_data as
(
    select * from {{ source('Project_Sales', 'sales_hierarchy') }}
)


select
    {{ clean_column('Salesperson ID', 'int') }},
    {{ clean_column('Salesperson Name', 'string') }},
    {{ clean_column('VP Sales', 'string') }},
    {{ clean_column('Regional Director', 'string') }}

from raw_data
