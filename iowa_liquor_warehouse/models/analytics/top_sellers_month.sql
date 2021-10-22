SELECT tr.vendor_number,
       tr.month_sale,
       tr.num_sales,
       RANK() OVER (PARTITION BY tr.month_sale ORDER BY tr.num_sales DESC) as rank_sales
FROM (
       SELECT vendor_number,
              EXTRACT(MONTH from date) as month_sale,
              count(*) num_sales,      
       FROM {{ source('raw_sales', 'sales')}} 
       GROUP BY 1,2 
       ORDER BY 2 DESC 
) as tr
GROUP BY 1,2,3
ORDER BY 3 DESC
