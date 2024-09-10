SELECT
    COUNT(DISTINCT c.customer_id) AS customer_id,
    CONCAT(c.first_name,' ',c.last_name) AS fullname, 
    SUM(o.order_quantity) AS total_quantity,
    CAST(SUM(oi.sale_price) AS int) AS total_sales
FROM {{ref("thelook_customers")}} c
JOIN {{ ref("thelook_orders")}} o ON c.customer_id = o.order_id
JOIN {{ ref("thelook_order_item")}} oi ON o.order_id = oi.order_item_id
WHERE NOT (o.order_status = 'Cancelled' OR o.order_status = 'Processing')
GROUP BY 2
ORDER BY total_sales DESC
