{# {{ clean_and_cast_stg_columns('Project_Sales', 'colors') }} #}



{% set source_table = source('Project_Sales', 'colors') %}

select
    {{ rename_columns_to_snake_case(source_table) }}
    {{ cast_data_type_columns({
        'Color ID': 'int',
        'Color Description': 'string',
        'Color Short Name': 'string',
    }) }}
    
    {{ solving_null_columns(['Color ID', 'Color Description', 'Color Short Name']) }}

from {{ source('Project_Sales', 'colors') }}