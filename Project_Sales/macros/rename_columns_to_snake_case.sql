{% macro rename_columns_to_snake_case(source_relation) %}
    
    {# 1. Lấy danh sách tất cả các cột từ model nguồn (được truyền qua ref) #}
    {% set columns = dbt_utils.get_filtered_columns_in_relation(source_relation) %}
    
    {# 2. Lặp qua từng cột và dùng Jinja để đổi tên sang snake_case #}
    {% for col in columns %}
        {% set clean_col = col | trim %}
        
        {# Thêm gạch dưới trước các chữ viết hoa (cho camelCase) #}
        {% set clean_col = modules.re.sub('([a-z0-9])([A-Z])', '\\1_\\2', clean_col) %}
        
        {# Thay thế khoảng trắng và ký tự đặc biệt bằng gạch dưới #}
        {% set clean_col = modules.re.sub('[^a-zA-Z0-9]+', '_', clean_col) %}
        
        {# Chuyển về chữ thường và xóa gạch dưới thừa ở đầu/cuối #}
        {% set clean_col = clean_col.lower().strip('_') %}
        
        {# Sinh câu lệnh SQL: cột_cũ as cột_mới #}
        `{{ col }}` as {{ clean_col }},
    {% endfor %}

{% endmacro %}