{% test check_unique_pk_columns(model, column_list) %}

with validation as (
    select
        {# 1. Gom nhóm theo toàn bộ các cột cấu thành Component Key #}
        {% for col_name in column_list %}
        `{{ col_name }}`
        {%- if not loop.last -%}, {%- endif -%}
        {% endfor %},
        count(*) as duplicate_count
    from {{ model }}
    group by 
        {% for col_name in column_list %}
        `{{ col_name }}`
        {%- if not loop.last -%}, {%- endif -%}
        {% endfor %}
)

{# 2. Trả về các tổ hợp khóa xuất hiện nhiều hơn 1 lần #}
select * from validation
where duplicate_count > 1

{% endtest %}