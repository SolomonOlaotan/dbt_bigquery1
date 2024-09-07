SELECT
    EXTRACT(YEAR FROM o.order_date) AS order_year, 
    EXTRACT(MONTH FROM o.order_date) AS order_month,
    CAST(SUM(oi.sale_price) AS decimal) AS monthly_sales
FROM 
    {{ ref("thelook_orders")}} o 
JOIN 
    {{ ref("thelook_order_item")}} oi 
    ON o.order_id = oi.order_id 
GROUP BY order_year, order_month
ORDER BY order_year, order_month