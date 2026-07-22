{{ config(
    materialized='view'
) }}

with customers as (
    select * from {{ ref('stg__customer_master') }}
),

ship_to as (
    select * from {{ ref('stg__ship_to_master') }}
)

select
    -- 1. Định danh chính
    ship_to.ship_to_id,
    customers.customer_id,
    
    -- 2. Đổi tên cột name để tránh xung đột
    customers.name as customer_name,
    ship_to.name as ship_to_name,
    customers.channel,

    -- 3. Địa chỉ thanh toán / Đăng ký kinh doanh (Billing Address - Từ Customer)
    customers.address_1 as billing_address_1,
    customers.city as billing_city,
    customers.state as billing_state,
    customers.country as billing_country,
    customers.zip_code as billing_zip_code,

    -- 4. Địa chỉ giao hàng thực tế (Shipping Address - Từ Ship_To)
    ship_to.address_1 as shipping_address_1,
    ship_to.city as shipping_city,
    ship_to.state as shipping_state,
    ship_to.country as shipping_country,
    ship_to.zip_code as shipping_zip_code,

    -- 5. Thời gian hiệu lực & Trạng thái hoạt động (Active Status)
    customers.customer_start_date,
    customers.customer_end_date,
    ship_to.ship_to_start_date,
    ship_to.ship_to_end_date,

    -- Cờ kiểm tra xem Khách hàng/Địa chỉ này còn hoạt động hay không
    case 
        when customers.customer_end_date is null or customers.customer_end_date > current_date() then true 
        else false 
    end as is_customer_active,

    case 
        when ship_to.ship_to_end_date is null then true 
        else false 
    end as is_ship_to_active

from ship_to
left join customers 
    on ship_to.customer_id = customers.customer_id