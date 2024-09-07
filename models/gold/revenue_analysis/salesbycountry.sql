SELECT
    c.country AS country, CAST(SUM(oi.sale_price) AS int) AS total_revenue

FROM 
    {{ ref("thelook_customers")}} c 
JOIN
    {{ ref("thelook_orders")}} o 
    ON c.customer_id = o.customer_id 
JOIN 
    {{ref("thelook_order_item")}} oi 
    ON o.order_id = oi.order_id 
GROUP BY country
ORDER BY total_revenue DESC