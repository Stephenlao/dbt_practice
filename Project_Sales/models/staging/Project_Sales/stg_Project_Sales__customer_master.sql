{# {{ clean_and_cast_stg_columns('Project_Sales', 'customer_master') }} #}

{# select
    coalesce(cast(address2 as string), 'N/A') as address2,
    coalesce(cast(address3 as string), 'N/A') as address3,
from {{ ref('model_name') }} #}

select * from {{ source('Project_Sales', 'customer_master') }}