SELECT
    product_category,
    CAST(SUM(cost)AS int) AS cost_products
FROM 
    {{ ref("thelook_products")}}
GROUP BY 
    1
ORDER BY
    cost_products DESC

