SELECT vendor_name, 
       count(*) num_sales,
       ROW_NUMBER() OVER (ORDER BY COUNT(*) DESC ) as rank_row_number_sales,
       RANK() OVER (ORDER BY COUNT(*) DESC) as rank_sales,
       DENSE_RANK() OVER(ORDER BY COUNT(*) DESC) as dense_rank_sales
FROM {{ source('raw_sales', 'sales')}} 
GROUP BY 1 
ORDER BY 2 DESC 