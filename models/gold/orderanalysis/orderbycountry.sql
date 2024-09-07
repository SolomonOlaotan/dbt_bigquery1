SELECT 
c.country,
COUNT(DISTINCT o.order_id) AS total_order
FROM
    {{ ref("thelook_customers")}} c 
JOIN 
    {{ ref("thelook_orders")}} o 
ON c.customer_id = o.customer_id
GROUP BY country
ORDER BY total_order DESC