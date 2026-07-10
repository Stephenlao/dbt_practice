{% macro cast_data_type_columns(column_type_dict) %}
    {% for col, target_type in column_type_dict.items() %}
        cast(`{{ col }}` as {{ target_type }}) as {{ col }},
    {% endfor %}
{% endmacro %}