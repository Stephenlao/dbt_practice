with raw_data as 
(
    select * from {{ source('Project_Sales', 'colors') }}
)

select
    -- We tell it to look for values like 1/1/9999. If it fails or is null, it goes to '9999-01-01'
    {{ clean_column('Color ID', 'int') }},
    {{ clean_column('Color Description', 'string') }},
    {{ clean_column('Color Short Name', 'string') }}
from raw_data