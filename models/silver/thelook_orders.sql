SELECT 
    order_id,
    user_id AS customer_id,
    status AS order_status,
    gender,
    DATE(created_at) AS order_date,
    DATE(returned_at) AS order_return_date,
    DATE(shipped_at) AS order_shipped_date,
    DATE(delivered_at) AS order_delivered_date,
    num_of_item AS order_quantity

FROM bigquery-public-data.thelook_ecommerce.orders