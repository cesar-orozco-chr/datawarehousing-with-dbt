SELECT  EXTRACT(QUARTER FROM date) quarter, 
        EXTRACT(MONTH FROM date) month,
        ROUND(SUM(sale_dollars)) as monthly_sales,
        RANK() OVER (ORDER BY ROUND(SUM(sale_dollars)) DESC) sales_rank
FROM {{ source('raw_sales', 'sales')}} 
GROUP BY 1,2
ORDER BY 1,2