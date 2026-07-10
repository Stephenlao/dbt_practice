{% macro solving_null_columns(column_list, default_value="'Unknown'") %}
    {% for col in column_list %}
        case 
            when `{{ col }}` is null then {{ default_value }}
            when trim(cast(`{{ col }}` as string)) = '' then {{ default_value }}
            else `{{ col }}`
        end as `{{ col }}`{% if not loop.last %},{% endif %}
    {% endfor %}
{% endmacro %}