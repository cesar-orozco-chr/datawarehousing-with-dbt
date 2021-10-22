SELECT  EXTRACT(YEAR FROM date) year,
        EXTRACT(QUARTER FROM date) quarter, 
        EXTRACT(MONTH FROM date) month,
        ROUND(SUM(sale_dollars)) as monthly_sales
FROM {{ source('raw_sales', 'sales')}} 
GROUP BY 1,2,3