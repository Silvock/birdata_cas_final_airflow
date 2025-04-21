WITH  orders_summary AS (
SELECT
 customer_id,
 customer_city,
 customer_state,
 SUM(total_order_amount) AS total_amount_spent,
 SUM(total_items) as total_items,
 SUM(total_distinct_items) as total_distinct_items,
 COUNT(DISTINCT order_id) AS total_orders
FROM {{ ref('int_sales__orders') }} 
GROUP BY
 customer_id,
 customer_city,
 customer_state
)

SELECT
 os.customer_id,
 customer_city,
 customer_state,
os.total_amount_spent,
os.total_items,
os.total_distinct_items,
os.total_orders,
p.favorite_product_id
FROM orders_summary AS os
LEFT JOIN {{ ref('int_sales__customer_favorite_product') }} p
ON os.customer_id = p.customer_id

