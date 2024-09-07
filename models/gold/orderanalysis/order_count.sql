SELECT 
COUNT(order_id) AS total_order
FROM 
    {{ ref("thelook_orders")}}
WHERE NOT (order_status = 'Cancelled' OR order_status = 'Processing')