{% test all_columns_null(model, exclude_column_list) %}
{%- if execute -%}
    {# dbt automatically passes the source relation into the 'model' variable #}
    {%- set source_columns = adapter.get_columns_in_relation(model) -%}

    {# Ensure the exclusion list items are uppercase for consistent comparison #}
    {%- set excluded_upper = [] -%}
    {%- for col in exclude_column_list -%}
        {%- do excluded_upper.append(col | upper) -%}
    {%- endfor -%}

    {%- for col in source_columns if col.column | upper not in excluded_upper %}
        select count(*) as c from (
            select `{{ col.column }}`
            from {{ model }}
            where `{{ col.column }}` is null
        )
        having c > 0
        {%- if not loop.last %}
        union all
        {%- endif %}
    {%- endfor -%}
{%- endif -%}
{% endtest %}