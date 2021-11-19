{% macro to_date(column) %}
 
 to_date(split_part(split_part({{ column }}, ' ', 1),'/',3) || '-' || split_part(split_part({{ column }}, ' ', 1),'/',2) || '-' || split_part(split_part({{ column }}, ' ', 1),'/',1),'YYYY-MM-DD')

{% endmacro %}