SELECT 
    ii.item_id, 
    ii.product_id, 
    ii.date_created, 
    ii.date_sold,
    COUNT(*) AS total_inventory,
    COUNT(CASE WHEN date_sold IS NOT NULL THEN '1' END) AS sold_count
FROM 
{{ ref("thelook_invent_items")}} ii 
GROUP BY 1,2,3,4