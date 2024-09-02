SELECT 
    dc.center_id,
    COUNT(DISTINCT o.order_id) AS total_order,
    CAST(SUM(oi.sale_price) AS int) AS total_sales
FROM
    {{ ref( "thelook_distribution_center")}} dc 
JOIN 
    {{ ref("thelook_products")}} p 
ON dc.center_id = p.center_id
JOIN 
    {{ ref("thelook_order_item")}} oi 
ON p.product_id = oi.product_id
JOIN 
    {{ ref("thelook_orders")}} o 
ON oi.order_item_id = o.order_id
GROUP BY center_id
ORDER BY total_order DESC