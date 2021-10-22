{{  config(materialized='view',
           schema='gold')}}
SELECT
    year,
    quarter,
    month,
    monthly_sales,
    LAG(monthly_sales) OVER (ORDER BY year, month, quarter, month) prev_monthly_sale
FROM {{ ref('monthly_sales') }}
ORDER BY quarter, month