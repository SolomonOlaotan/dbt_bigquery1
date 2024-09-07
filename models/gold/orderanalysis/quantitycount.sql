SELECT
    SUM(order_quantity) AS quantity_sold
FROM 
    {{ ref("thelook_orders")}}