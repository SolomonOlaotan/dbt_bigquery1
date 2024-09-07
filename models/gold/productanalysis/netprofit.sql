WITH gross_revenue AS (
    SELECT
        CAST(SUM(sale_price) AS int) AS total_sales
    FROM 
        {{ ref("thelook_order_item")}} 
    WHERE NOT 
)