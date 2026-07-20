{{ config(
    materialized='view'
) }}

with header as (
    select * from {{ ref('stg_invoice_header') }}
),

detail as (
    select * from {{ ref('stg_invoice_detail') }}
)

select
    -- 1. Khóa chính và các thông tin định danh
    detail.invoice_number,
    detail.line_number,
    detail.product_id,
    detail.warehouse_id,
    header.customer_id,
    header.ship_to_id,
    header.salesperson_id,
    header.order_number,
    header.customer_po_number,

    -- 2. Thông tin thời gian
    header.order_date,
    header.invoice_date,
    header.requested_ship_date,
    header.promised_ship_date,
    header.actual_ship_date,
    
    -- Phân tích hiệu suất giao hàng (Tính số ngày lệch)
    datediff(header.actual_ship_date, header.promised_ship_date) as days_delayed,
    case 
        when header.actual_ship_date > header.promised_ship_date then true 
        else false 
    end as is_shipped_late,

    -- 3. Thông tin đơn vị đo lường (Unit of Measure) và phân loại
    detail.u_m,
    detail.line_type,

    -- 4. Thông tin số lượng và đơn giá
    detail.ordered_quantity,
    detail.shipped_quantity,
    detail.invoiced_quantity,
    detail.list_price,
    detail.order_price,
    detail.unit_cost,

    -- 5. Tính toán các chỉ số tài chính phái sinh (Biến đổi nâng cao)
    (detail.invoiced_quantity * detail.order_price) as gross_revenue,
    (detail.invoiced_quantity * detail.unit_cost) as cogs,
    
    -- Tính số tiền giảm giá của riêng dòng này (Line Discount)
    (detail.invoiced_quantity * detail.order_price * detail.line_discount) as line_discount_amount,
    
    -- Tỷ lệ giảm giá chung của toàn hóa đơn được đưa vào để phân bổ nếu cần
    header.invoice_discount

from detail
inner join header 
    on detail.invoice_number = header.invoice_number