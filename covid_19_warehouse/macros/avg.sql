{% macro avg(column) %}
AVG({{ column }})
{% endmacro %}