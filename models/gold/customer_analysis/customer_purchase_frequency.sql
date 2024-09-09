SELECT
    c.customer_id,
    o.order_date,
    oi.sale_price,
    COUNT(o.order_id) OVER(PARTITION BY c.customer_id) AS Purchase_Frequency   
FROM
    {{ ref("thelook_customers")}} c
JOIN 
    {{ ref("thelook_orders")}} o 
ON 
    o.order_id = c.customer_id
JOIN 
    {{ ref("thelook_order_item")}} oi 
ON
    o.order_id = oi.order_item_id
GROUP BY o.order_date, o.order_id, c.customer_id, oi.sale_price
ORDER BY 
    o.order_id DESC
