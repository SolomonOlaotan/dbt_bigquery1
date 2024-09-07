SELECT 
COUNT(order_id) AS total_order
FROM 
    {{ ref("thelook_orders")}}