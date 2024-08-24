SELECT
    CASE
        WHEN c.age BETWEEN 18 AND 25 THEN '18-25'
        WHEN c.age BETWEEN 26 AND 35 THEN '26-35'
        WHEN c.age BETWEEN 36 AND 45 THEN '36-45'
        ELSE 46+
        END AS age_group,
    p.product_category,
    COUNT(*) AS total_order
FROM 
    {{ ref("thelook_customers")}} c 
JOIN 
    {{ ref("thelook_orders")}} o 
    ON c.customer_id = o.customer_id
JOIN 
    {{ ref("thelook_order_item")}} oi 
    ON o.order_id = oi.order_id 
JOIN
    {{ref("thelook_products")}} p 
    ON oi.product_id = p.product_id
GROUP BY p.product_category, age_group
