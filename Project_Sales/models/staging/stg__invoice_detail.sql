with raw_data as 
(
    select * from {{ source('Project_Sales', 'invoice_detail') }}
)

select
    {{ clean_column('Invoice Number', 'int') }},
    {{ clean_column('Line Number', 'int') }},
    {{ clean_column('Product ID', 'int') }},
    {{ clean_column('Warehouse ID', 'int') }},
    {{ clean_column('Ordered Quantity', 'int') }},
    {{ clean_column('Shipped Quantity', 'int') }},
    {{ clean_column('Invoiced Quantity', 'int') }},
    {{ clean_column('List Price', 'double') }},
    {{ clean_column('Order Price', 'double') }},
    {{ clean_column('Unit Cost', 'double') }},
    {{ clean_column('U/M', 'string' ) }},
    {{ clean_column('Ordered Quantity STD UM', 'int') }},
    {{ clean_column('Shipped Quantity STD UM', 'int') }},
    {{ clean_column('Invoiced Quantity STD UM', 'int') }},
    {{ clean_column('List Price STD UM', 'double') }},
    {{ clean_column('Order Price STD UM', 'double') }},
    {{ clean_column('Unit Cost STD UM', 'double') }},
    {{ clean_column('Line Discount %', 'double') }},
    {{ clean_column('Line Type', 'string') }}


from raw_data