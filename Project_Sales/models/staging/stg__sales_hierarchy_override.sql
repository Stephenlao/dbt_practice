with raw_data as
(
    select * from {{ source('Project_Sales', 'sales_hierarchy_override') }}
)


select
    {{ clean_column('Salesperson', 'string') }},
    {{ clean_column('RD', 'string') }}
from raw_data
