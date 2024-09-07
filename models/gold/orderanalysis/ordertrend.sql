SELECT
    COUNT(order_id) AS total_order,
    order_date,
    order_status,
    order_quantity
FROM 
    {{ ref("thelook_orders")}}
WHERE NOT (order_status = 'Cancelled' OR order_status = 'Returned' OR order_status = 'Processing') 
GROUP BY 2,3,4
ORDER BY total_order DESC