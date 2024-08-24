SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    SUM(o.order_quantity) AS total_quantity,
    SUM(oi.sale_price) AS total_sales
FROM {{ref("thelook_customers")}} c
JOIN {{ ref("thelook_orders")}} o ON c.customer_id = o.order_id
JOIN {{ ref("thelook_order_item")}} oi ON o.order_id = oi.order_item_id
GROUP BY 1,2,3
ORDER BY total_sales DESC