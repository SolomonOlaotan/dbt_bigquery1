SELECT 
    CAST(SUM(sale_price) AS int) AS gross_revenue
FROM 
    {{ ref("thelook_order_item")}}
WHERE NOT (order_item_status = 'Cancelled' OR order_item_status = 'Processing')

