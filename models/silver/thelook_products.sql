SELECT 
    id AS product_id,
    ROUND(cost, 2) AS cost,
    category AS product_category,
    name AS product_name,
    brand AS product_brand,
    ROUND(retail_price, 2) AS retail_price,
    department,
    distribution_center_id AS center_id 
FROM bigquery-public-data.thelook_ecommerce.products