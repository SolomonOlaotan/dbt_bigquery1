SELECT
    COUNT(order_id) AS total_order,
    EXTRACT(YEAR FROM order_date) year_ordered,
    EXTRACT(MONTH FROM order_date) month_ordered,
    order_status,
    SUM(order_quantity) AS order_quantity
FROM 
    {{ ref("thelook_orders")}}
WHERE NOT (order_status = 'Cancelled' OR order_status = 'Processing') 
GROUP BY 2,3,4
ORDER BY 
    order_quantity DESC,
    month_ordered DESC