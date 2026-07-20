with raw_data as
(
    select * from {{ source('Project_Sales', 'ship_to_master') }}
)




select
    {{ clean_column('Ship To ID', 'int') }},
    {{ clean_column('Customer ID', 'int') }},
    {{ clean_column('Name', 'string') }},
    {{ clean_column('Address 1', 'string') }},
    {{ clean_column('Address 2', 'string') }},
    {{ clean_column('Address 3', 'string') }},
    {{ clean_column('City', 'string') }},
    {{ clean_column('State', 'string') }},
    {{ clean_column('Country', 'string') }},
    {{ clean_column('ZIP Code', 'int') }},
    {{ clean_column('ShipTo Start Date', 'date') }},
    {{ clean_column('ShipTo End Date', 'date') }}


from raw_data
