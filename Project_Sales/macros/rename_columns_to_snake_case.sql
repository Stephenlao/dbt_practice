{% macro to_snake_case(column_name) %}
    {%- set clean_col = column_name | trim -%}
    {%- set clean_col = modules.re.sub('([a-z0-9])([A-Z])', '\\1_\\2', clean_col) -%}
    {%- set clean_col = modules.re.sub('[^a-zA-Z0-9]+', '_', clean_col) -%}
    {{- clean_col.lower().strip('_') -}}
{% endmacro %}