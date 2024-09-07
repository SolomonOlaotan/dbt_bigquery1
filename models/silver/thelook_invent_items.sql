SELECT 
    id AS item_id,
    product_id,
    DATE(created_at) AS date_created,
    DATE(sold_at) AS date_sold,
    ROUND(cost, 2) AS cost,
    product_category,
    product_name,
    product_brand,
    ROUND(product_retail_price, 2) AS retail_price,
    product_department AS department,
    product_distribution_center_id AS center_id

FROM bigquery-public-data.thelook_ecommerce.inventory_items
