{% macro cast_data_type_columns(column_name, target_type) %}
{% set quoted_column = adapter.quote(column_name) if ' ' in column_name else column_name %}

    try_cast({{ quoted_column }} as {{ target_type }})
{% endmacro %}