{{  config(materialized='table',
           schema='gold')}}
{% set fields_to_avg = ["evolution_interval", "recovered_interval"] %}

with covid_events as (
    SELECT *
    FROM {{ ref('fact_covid_event')}}
), locations as (
    SELECT *
    FROM {{ ref('dim_location')}}
)

SELECT l.state_name, 
       l.city_name,
       {% for field_to_avg in fields_to_avg%}
        avg({{ field_to_avg}}),
       {% endfor %}
FROM covid_events as ce
INNER JOIN locations as l ON ce.state_id = l.state_id and cd.city_id = l.city_id
GROUP BY 1, 2
