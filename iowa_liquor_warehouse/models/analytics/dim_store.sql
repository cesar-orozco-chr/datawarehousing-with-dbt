SELECT distinct store_number, 
                store_name, 
                address,
                city,
                zip_code,
                store_location 
FROM {{ source('raw_sales', 'sales')}}