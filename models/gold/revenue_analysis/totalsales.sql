SELECT
    CAST(SUM(sale_price) AS int) AS total_revenue,
    CAST(AVG(sale_price) AS int) AS avg_sales_price,
    COUNT(order_item_id) AS toatl_ordered_item
FROM 
    {{ ref("thelook_order_item")}}
WHERE NOT
        (order_item_status = 'Cancelled' OR order_item_status='Processing')
