{{ config(
    materialized='view'
) }}

with base_hierarchy as (
    select * from {{ ref('stg__sales_hierarchy') }}
),

override_hierarchy as (
    select * from {{ ref('stg__sales_hierarchy_override') }}
)

select
    -- 1. Mã định danh và tên nhân viên sales
    base.salesperson_id,
    base.salesperson_name,

    -- 2. Cấp lãnh đạo cao nhất (VP Sales)
    base.vp_sales,

    -- 3. Cấp Giám đốc vùng (Regional Director) - Áp dụng Override logic
    coalesce(override.rd, base.regional_director) as regional_director,

    -- 4. Giữ lại thông tin gốc để phục vụ đối soát (Audit Trail)
    base.regional_director as original_regional_director,

    -- Cờ đánh dấu nhân viên này có bị ghi đè cấu trúc quản lý hay không
    case 
        when override.rd is not null then true 
        else false 
    end as is_overridden

from base_hierarchy as base
left join override_hierarchy as override
    on trim(lower(base.salesperson_name)) = trim(lower(override.salesperson))