SELECT
    COUNT(DISTINCT customer_id) AS Customer_Count
FROM {{
    ref("thelook_customers")
}}