SELECT 
    id AS order_item_id,
    order_id,
    user_id AS customer_id,
    product_id,
    inventory_item_id AS item_id,
    status AS order_item_status,
    DATE(created_at) AS order_item_date,
    DATE(shipped_at) AS order_item_shipped_date,
    DATE(delivered_at) AS order_item_delivered_date,
    DATE(returned_at) AS order_item_return_date,
    ROUND(sale_price, 2) AS sale_price
FROM bigquery-public-data.thelook_ecommerce.order_items