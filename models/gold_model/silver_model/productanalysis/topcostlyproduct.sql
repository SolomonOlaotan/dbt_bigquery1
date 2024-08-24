SELECT
product_category,
department,
CAST(AVG(cost)AS decimal) AS avg_cost_product,
CAST(AVG(retail_price) AS decimal) AS avg_retail_price
FROM 
    {{ ref("thelook_products")}}
GROUP BY 
    1,2
ORDER BY
avg_cost_product DESC
