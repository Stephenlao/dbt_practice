with raw_data as 
(
    select * from {{ source('Project_Sales', 'invoice_header') }}
)

select
    {{ clean_column('Invoice Number', 'int') }},
    {{ clean_column('Customer ID', 'int') }},
    {{ clean_column('Ship To ID', 'int') }},
    {{ clean_column('Salesperson ID', 'int') }},
    {{ clean_column('Order Number', 'int') }},
    {{ clean_column('Customer PO Number', 'int') }},
    {{ clean_column('Order Date', 'timestamp') }},
    {{ clean_column('Requested Ship Date', 'timestamp') }},
    {{ clean_column('Promised Ship Date', 'timestamp') }},
    {{ clean_column('Actual Ship Date', 'timestamp') }},
    {{ clean_column('Invoice Date', 'timestamp') }},
    {{ clean_column('Invoice Discount %', 'decimal') }}



from raw_data