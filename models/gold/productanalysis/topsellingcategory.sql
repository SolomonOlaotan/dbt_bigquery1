SELECT
    p.product_category,
    CAST(SUM(oi.sale_price) AS decimal) AS total_sales,
    COUNT(o.order_id) AS total_order,
    CAST(AVG(oi.sale_price)AS decimal) AS average_order_value,
    DATE_TRUNC(DATE(o.order_date), MONTH) AS order_month
 
FROM 
    {{ ref("thelook_order_item")}} oi 
JOIN 
    {{ref("thelook_orders")}} o
ON 
    oi.order_item_id = o.order_id
JOIN 
    {{ ref("thelook_products")}} p 
ON 
    oi.product_id = p.product_id
GROUP BY    
    p.product_category, order_month
ORDER BY  order_month

