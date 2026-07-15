{% macro cast_date_format(column_name, format_string="'M/d/yyyy'") %}
{% set quoted_column = adapter.quote(column_name) if ' ' in column_name else column_name %}

    to_date({{ quoted_column }}, {{ format_string }})
{% endmacro %}