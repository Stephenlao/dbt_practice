{% macro solving_null_columns(column_name, default_value="'Unknown'") %}
-- quoted_column: solving column name with space
{% set quoted_column = adapter.quote(column_name) if ' ' in column_name else column_name %}
    case 
        when {{ quoted_column }} is null then {{ default_value }}
        when trim(cast({{ quoted_column }} as string)) = '' then {{ default_value }}
        else {{ quoted_column }}
    end
{% endmacro %}