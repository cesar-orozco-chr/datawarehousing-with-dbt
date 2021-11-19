{{
config({
    "post-hook": [
      "{{ covid19_warehouse.index(this, 'id')}}",
    ],
    })
}}
SELECT  row_number() OVER() as id,
        s.state_id, 
		s.city_id,
		s.origin_country_id, 
		s.origin_country_name,
		current_timestamp as record_timestamp
FROM 
(
	SELECT DISTINCT state_id, 
		 			city_id,
				    origin_country_id, 
					origin_country_name
	FROM {{ ref('covid_19_sources')}} 
) as s
