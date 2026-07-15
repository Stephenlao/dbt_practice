with raw_data as
(
    select * from {{ source('Project_Sales', 'product_master') }}
)


select
    {{ clean_column('Product ID', 'int') }},
    {{ clean_column('Product Description', 'string') }},
    {{ clean_column('Style ID', 'int') }},
    {{ clean_column('Color ID', 'int') }},
    {{ clean_column('Size ID', 'int') }},
    {{ clean_column('List Price', 'double') }},
    {{ clean_column('Standard Cost', 'double') }},
    {{ clean_column('First Introduction Date', 'date', date_format='d/m/yyyy') }},
    {{ clean_column('Closeout Date', 'date', date_format='d/m/yyyy') }}

from raw_data