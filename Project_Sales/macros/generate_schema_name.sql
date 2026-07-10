{% macro generate_schema_name(custom_schema_name, node) -%}

    {# Nếu là môi trường Production hoặc có khai báo custom_schema, chỉ lấy tên custom #}
    {%- if custom_schema_name is not none -%}

        {{ custom_schema_name | trim }}

    {# Ngược lại, nếu không cấu hình gì thì mới dùng schema mặc định trong profiles.yml #}
    {%- else -%}

        {{ schema }}

    {%- endif -%}

{%- endmacro %}