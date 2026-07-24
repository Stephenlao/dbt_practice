{{ config(
    materialized='table'
) }}

with invoice_lines as (
    select * from {{ ref('int__sales_aggregate') }}
)

select
    md5(concat_ws('-', invoice_number, line_number, product_id)) as sales_invoice_sk,
    *

from invoice_lines