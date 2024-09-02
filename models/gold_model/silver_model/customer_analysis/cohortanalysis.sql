WITH first_purchase AS (
    SELECT 
    customer_id,
    MIN(order_date) AS first_order_date
    FROM 
    {{ ref("thelook_orders")}}
    GROUP BY customer_id
)
SELECT
    EXTRACT(YEAR FROM fp.first_order_date) AS cohort_year,
    EXTRACT(MONTH FROM fp.first_order_date) AS cohort_month,
    COUNT(DISTINCT o.customer_id) AS retention_count
FROM 
    {{ ref("thelook_orders")}} o 
JOIN 
    first_purchase fp 
ON o.customer_id = fp.customer_id 
WHERE EXTRACT(YEAR FROM o.order_date) = 'cohort_year' AND 
    EXTRACT(MONTH FROM o.order_date) = 'cohort_month' + 1
GROUP BY cohort_year, cohort_month