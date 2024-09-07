SELECT
    id AS customer_id,
    first_name,
    last_name,
    email,
    age,
    gender,
    state,
    street_address,
    city,
    country,
    latitude,
    longitude,
    traffic_source as source,
    DATE(created_at) AS date_created
from bigquery-public-data.thelook_ecommerce.users