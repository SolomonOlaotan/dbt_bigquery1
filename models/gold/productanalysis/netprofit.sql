WITH discount AS (
    SELECT
        CAST(SUM(oi.sale_price - p.retail_price) AS int) AS discounted_price
FROM 
    {{ ref("thelook_order_item")}} oi 
JOIN 
    {{ ref("thelook_products")}} p 
ON oi.order_item_id = p.product_id
),
profit AS (
    SELECT
        CAST(SUM(oi.sale_price - p.cost) AS int) AS gross_profit
    FROM 
        {{ ref("thelook_order_item")}} oi
    JOIN
        {{ ref("thelook_products")}} p
    ON oi.order_item_id = p.product_id
    WHERE NOT (oi.order_item_status = 'Cancelled' 
                OR oi.order_item_status = 'Processing'
                OR oi.order_item_status = 'Returned')
)
SELECT
    (gross_profit - discounted_price) AS net_profit
FROM 
    discount, profit 

