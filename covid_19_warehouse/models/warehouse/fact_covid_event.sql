{{
config({
    "post-hook": [
      "{{ covid19_warehouse.index(this, 'event_id')}}",
    ],
    })
}}
SELECT event_id,
       report_date,
       age,
       genre,
       contagious_type,
       event_location,
       status_name,
       recovered,
       recovered_type,
       diagnostic_date,
       symptons_date,
       recovered_date,
       state_id,
       city_id,
       age(diagnostic_date, symptons_date) as evolution_interval,
       age(recovered_date, symptons_date) as recovered_interval,
       current_timestamp as record_timestamp
FROM {{ ref('covid_19_sources')}}
