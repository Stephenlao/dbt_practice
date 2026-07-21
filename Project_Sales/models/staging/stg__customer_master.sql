with raw_data as 
(
    select * from {{ source('Project_Sales', 'customer_master') }}
)

select
    {{ clean_column('Customer ID', 'int') }},
    {{ clean_column('Name', 'string') }},
    {{ clean_column('Address 1', 'string') }},
    {{ clean_column('Address 2', 'string') }},
    {{ clean_column('Address 3', 'string') }},
    {{ clean_column('City', 'string') }},
    {{ clean_column('State', 'string') }},
    {{ clean_column('Country', 'string') }},
    {{ clean_column('ZIP Code', 'int') }},
    {{ clean_column('Channel', 'string') }},
    {{ clean_column('Customer Start Date', 'date' ) }},
    {{ clean_column('Customer End Date', 'date', date_format='M/d/yyyy') }}
from raw_data