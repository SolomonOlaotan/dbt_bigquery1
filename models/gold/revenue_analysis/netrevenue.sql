WITH revenue as (
    SELECT 
        SUM(sale_price) AS total_revenue
    FROM
        {{ ref("thelook_order_item")}} 
    WHERE NOT (order_item_status = 'Cancelled' OR order_item_status = 'Processing')
),
returned_sales AS (
    SELECT
    SUM(sale_price) AS return_sales
    FROM 
    {{ ref("thelook_order_item")}}
    WHERE order_item_status = 'Returned'
)
SELECT
    CAST(total_revenue - return_sales AS int) AS net_revenue
FROM 
    revenue, returned_sales


