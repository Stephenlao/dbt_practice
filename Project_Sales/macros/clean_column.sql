{% macro clean_column(column_name, target_type, default_value=none, date_format=none) %}
    
    {# 1. Generate the clean snake_case alias text #}
    {%- set snake_name = column_name | trim -%}
    {%- set snake_name = modules.re.sub('([a-z0-9])([A-Z])', '\\1_\\2', snake_name) -%}
    {%- set snake_name = modules.re.sub('[^a-zA-Z0-9]+', '_', snake_name) -%}
    {%- set snake_name = snake_name.lower().strip('_') -%}

    {# 2. Handle quoting for the source column #}
    {%- if modules.re.search('[^a-zA-Z0-9]', column_name) -%}
        {%- set source_column = '`' ~ column_name ~ '`' -%}
    {%- else -%}
        {%- set source_column = column_name -%}
    {%- endif -%}

    {# 3. Build the conversion logic #}
    {%- if target_type | lower == 'date' -%}
        
        {# Use the provided default value, or fall back to your preferred '9999-01-01' date #}
        {%- set final_default = default_value if default_value is not none else "'9999-01-01'" -%}
        
        {# If a specific string format is provided (like MM/dd/yyyy or d/m/yyyy), use try_to_date #}
        {%- if date_format is not none -%}
            {%- set date_attempt = "try_to_date(" ~ source_column ~ ", '" ~ date_format ~ "')" -%}
        {%- else -%}
            {%- set date_attempt = "try_cast(" ~ source_column ~ " as date)" -%}
        {%- endif -%}

        {# The final expression returns a strict DATE type #}
        {%- set conversion_expr = "coalesce(" ~ date_attempt ~ ", cast(" ~ final_default ~ " as date))" -%}
        
    {%- else -%}
        
        {# Logic for non-date standard types (int, string, etc.) #}
        {%- if default_value is none -%}
            {%- set default_value = 0 if target_type | lower in ['int', 'integer', 'float', 'double'] else "'Unknown'" -%}
        {%- endif -%}
        {%- set conversion_expr = "coalesce(try_cast(" ~ source_column ~ " as " ~ target_type ~ "), " ~ default_value ~ ")" -%}
        
    {%- endif -%}

    {# 4. Final SQL Output #}
    {{ conversion_expr }} as {{ snake_name }}

{% endmacro %}