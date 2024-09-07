WITH first_purchase AS (
    SELECT 
    customer_id,
    MIN(order_date) AS first_order_date
    FROM 
    {{ ref("thelook_orders")}}
    GROUP BY customer_id
),
cohorts AS (
SELECT
    customer_id,
    EXTRACT(YEAR FROM first_order_date) AS cohort_year,
    EXTRACT(MONTH FROM first_order_date) AS cohort_month
FROM 
    first_purchase  

),
retention AS (
    SELECT
        c.customer_id,
        c.cohort_year,
        c.cohort_month,
        EXTRACT(YEAR FROM o.order_date) AS order_year,
        EXTRACT(MONTH FROM O.order_date) AS order_month
    FROM 
        {{ ref("thelook_orders")}} o 
    JOIN
    cohort c ON c.customer_id = o.customer_id
)
/*Count unique customers making purchases in the month
following their first purchase*/
SELECT
    cohort_year,
    cohort_month,
    COUNT(DISTINCT customer_id) AS retention_count
FROM 
    retention
WHERE 
    (order_year * 12 + order_month) = (cohort_year * 12 + cohort_month +1)
GROUP BY
    cohort_year,
    cohort_month
ORDER BY 
    cohort_year,
    cohort_month
